package com.group22.hub.Controller;

import com.google.gson.JsonElement;
import com.group22.hub.Service.ReverseCompute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SimulationController {
    List<List<JsonElement>> execution_history = new ArrayList<>();
    int forwardExecutionStoreX = 0;
    int forwardExecutionStoreY = 0;
    List<List<JsonElement>> stack_trace_history = new ArrayList<>();
    int index= 0;
    String code_executed;

    //Method to split and add pointer to the String for better understanding
    public StringBuilder Pointer (){
        StringBuilder input = new StringBuilder();
        String[] Array = code_executed.split("\n");
        for(int i = 0; i < Array.length; i++){
            if (i == index){
                input.append("---> ").append(Array[i]).append("\n");
            }
            else{
                input.append(Array[i]).append("\n");
            }
        }
        return input;
    }

    //Get request for URL /simulator
    @RequestMapping("/simulator")
    public String simulator (){
        return "Simulation";
    }

    //Post Request for URL /simulator
    @PostMapping("/simulator")
    public String simulate(@RequestParam("action") String action, @RequestParam("code") String code, Model model) throws IOException {
        StringBuilder output = new StringBuilder(); //Verbal feedback to what is going on
        StringBuilder stacktrace = new StringBuilder(); //Visual feedback to show stacktrace
        StringBuilder memory = new StringBuilder(); //Visual feedback to show current stores of the values
        StringBuilder input = new StringBuilder(); //Visual feedback to show an arrow pointing to the code being executed

        //Checks to see if user has gone over or under index of the Code Execution
        try {

            //If the code is simulated
            switch (action) {
                case "Sim":
                    //Resets the List and index values
                    execution_history = new ArrayList<>();
                    index = 0;

                    //Code is localised
                    code_executed = code;

                    //Creates a class using the code
                    ReverseCompute compute = new ReverseCompute(code);

                    //Sends a Get request on the code to a Python API
                    String returnValue = compute.SendGet();

                    //Creates an objects list which indicates whether to show the list forward or reversed
                    List<String> objects = compute.GetExecutionCode(returnValue);

                    //Stores the current stores after final execution of code locally
                    forwardExecutionStoreX = compute.GetStore(compute.GetCurrentStore(objects.get(0)), "x");
                    forwardExecutionStoreY = compute.GetStore(compute.GetCurrentStore(objects.get(0)), "y");

                    //Loops through History of forward execution and stack trace history adding each element to local Arrays
                    for (int i = 0; i < compute.CountHistoryElements(compute.GetHistory(objects.get(0))); i++) {
                        List<JsonElement> execution = compute.GetHistoryArray(compute.GetHistory(objects.get(0)), i);
                        List<JsonElement> stack = compute.GetHistoryArray(compute.GetStackTrace(objects.get(0)), i);
                        execution_history.add(execution);
                        stack_trace_history.add(stack);
                    }
                    //Appends to the output string
                    output.append("Forward execution on: ").append(execution_history.get(index).get(0)).append("\n");
                    output.append("Program moving old value to the correct stack ... \n");

                    //Assigns the input to pointer method
                    input = Pointer();
                    break;

                //Adds 1 to the index and appends to the output string
                case "Forward":
                    index += 1;
                    output.append("Forward execution on: ").append(execution_history.get(index).get(0)).append("\n");
                    output.append("Program moving old value to the correct stack ... \n");
                    input = Pointer();
                    break;

                //Minus -1 from index and appends to output string
                case "Backward":
                    index -= 1;
                    output.append("Reverse execution on: ").append(execution_history.get(index + 1).get(0)).append("\n");
                    output.append("Program retrieving value from top of correct stack ... \n");
                    index += 1;
                    input = Pointer();
                    index -= 1;
                    break;
            }
            //Outputs the stack trace list for each variable
            stacktrace.append("X stack: ").append(stack_trace_history.get(index).get(1)).append("\n");
            stacktrace.append("Y stack: ").append(stack_trace_history.get(index).get(2));

            //Outputs the Current stores of the variables if code reached the end
            if (index == execution_history.size() - 1) {
                memory.append("Store X = ").append(forwardExecutionStoreX).append("\n");
                memory.append("Store Y = ").append(forwardExecutionStoreY);
            }

            //Outputs current stores of variables
            else if (index >= 0) {
                memory.append("Store X = ").append(execution_history.get(index + 1).get(1)).append("\n");
                memory.append("Store Y = ").append(execution_history.get(index + 1).get(2));
            }
        }

        //If Index out of Bounds
        catch (IndexOutOfBoundsException e) {

            //If index is below 0
            if(index < 0){
                //Set to 0 and show beginning state of the system
                index = 0;
                output=new StringBuilder();
                stacktrace=new StringBuilder();
                output.append("Reverse execution on: ").append(execution_history.get(index).get(0)).append("\n");
                output.append("Program retrieving value from top of correct stack ... \n");
                memory.append("Store X = 1 \n");
                memory.append("Store Y = 1");
                stacktrace.append("X stack: [] \n");
                stacktrace.append("Y stack: [] \n");
                input = Pointer();

                //Decrease again so the indexing of where the user is doesn't mess up
                index = -1;
            }

            //If index is above the size of array
            else if (index >= execution_history.size()){
                //Minus 1 from the index to show final state of the system
                output = new StringBuilder("You have reached the final statement going forward ! \n");
                index -= 1;
                output.append("Code executed previously: ").append(execution_history.get(index).get(0));
                memory.append("Store X = ").append(forwardExecutionStoreX).append("\n");
                memory.append("Store Y = ").append(forwardExecutionStoreY);
                stacktrace.append("X stack: ").append(stack_trace_history.get(index).get(1)).append("\n");
                stacktrace.append("Y stack: ").append(stack_trace_history.get(index).get(2));
                input = Pointer();
            }
        }

        //Add all attributes to model and send back to jsp
        model.addAttribute("memory", memory.toString());
        model.addAttribute("stack", stacktrace.toString());
        model.addAttribute("output", output.toString());
        model.addAttribute("input", input);
        return "Simulation";
    }

    //Simulator to keep user's logged in
    @RequestMapping("/user-simulator")
    public String simulatorLoggedIn (){
        return "Simulation-logged-in";
    }


    //Simulator Output to keep user's logged in
    @PostMapping("/user-simulator")
    public String simulateLoggedIn(@RequestParam("action") String action, @RequestParam("code") String code, Model model) throws IOException {
        StringBuilder output = new StringBuilder(); //Verbal feedback to what is going on
        StringBuilder stacktrace = new StringBuilder(); //Visual feedback to show stacktrace
        StringBuilder memory = new StringBuilder(); //Visual feedback to show current stores of the values
        StringBuilder input = new StringBuilder(); //Visual feedback to show an arrow pointing to the code being executed

        //Checks to see if user has gone over or under index of the Code Execution
        try {

            //If the code is simulated
            switch (action) {
                case "Sim":
                    //Resets the List and index values
                    execution_history = new ArrayList<>();
                    index = 0;

                    //Code is localised
                    code_executed = code;

                    //Creates a class using the code
                    ReverseCompute compute = new ReverseCompute(code);

                    //Sends a Get request on the code to a Python API
                    String returnValue = compute.SendGet();

                    //Creates an objects list which indicates whether to show the list forward or reversed
                    List<String> objects = compute.GetExecutionCode(returnValue);

                    //Stores the current stores after final execution of code locally
                    forwardExecutionStoreX = compute.GetStore(compute.GetCurrentStore(objects.get(0)), "x");
                    forwardExecutionStoreY = compute.GetStore(compute.GetCurrentStore(objects.get(0)), "y");

                    //Loops through History of forward execution and stack trace history adding each element to local Arrays
                    for (int i = 0; i < compute.CountHistoryElements(compute.GetHistory(objects.get(0))); i++) {
                        List<JsonElement> execution = compute.GetHistoryArray(compute.GetHistory(objects.get(0)), i);
                        List<JsonElement> stack = compute.GetHistoryArray(compute.GetStackTrace(objects.get(0)), i);
                        execution_history.add(execution);
                        stack_trace_history.add(stack);
                    }
                    //Appends to the output string
                    output.append("Forward execution on: ").append(execution_history.get(index).get(0)).append("\n");
                    output.append("Program moving old value to the correct stack ... \n");

                    //Assigns the input to pointer method
                    input = Pointer();
                    break;

                //Adds 1 to the index and appends to the output string
                case "Forward":
                    index += 1;
                    output.append("Forward execution on: ").append(execution_history.get(index).get(0)).append("\n");
                    output.append("Program moving old value to the correct stack ... \n");
                    input = Pointer();
                    break;

                //Minus -1 from index and appends to output string
                case "Backward":
                    index -= 1;
                    output.append("Reverse execution on: ").append(execution_history.get(index + 1).get(0)).append("\n");
                    output.append("Program retrieving value from top of correct stack ... \n");
                    index += 1;
                    input = Pointer();
                    index -= 1;
                    break;
            }
            //Outputs the stack trace list for each variable
            stacktrace.append("X stack: ").append(stack_trace_history.get(index).get(1)).append("\n");
            stacktrace.append("Y stack: ").append(stack_trace_history.get(index).get(2));

            //Outputs the Current stores of the variables if code reached the end
            if (index == execution_history.size() - 1) {
                memory.append("Store X = ").append(forwardExecutionStoreX).append("\n");
                memory.append("Store Y = ").append(forwardExecutionStoreY);
            }

            //Outputs current stores of variables
            else if (index >= 0) {
                memory.append("Store X = ").append(execution_history.get(index + 1).get(1)).append("\n");
                memory.append("Store Y = ").append(execution_history.get(index + 1).get(2));
            }
        }

        //If Index out of Bounds
        catch (IndexOutOfBoundsException e) {

            //If index is below 0
            if(index < 0){
                //Set to 0 and show beginning state of the system
                index = 0;
                output=new StringBuilder();
                stacktrace=new StringBuilder();
                output.append("Reverse execution on: ").append(execution_history.get(index).get(0)).append("\n");
                output.append("Program retrieving value from top of correct stack ... \n");
                memory.append("Store X = 1 \n");
                memory.append("Store Y = 1");
                stacktrace.append("X stack: [] \n");
                stacktrace.append("Y stack: [] \n");
                input = Pointer();

                //Decrease again so the indexing of where the user is doesn't mess up
                index = -1;
            }

            //If index is above the size of array
            else if (index >= execution_history.size()){
                //Minus 1 from the index to show final state of the system
                output = new StringBuilder("You have reached the final statement going forward ! \n");
                index -= 1;
                output.append("Code executed previously: ").append(execution_history.get(index).get(0));
                memory.append("Store X = ").append(forwardExecutionStoreX).append("\n");
                memory.append("Store Y = ").append(forwardExecutionStoreY);
                stacktrace.append("X stack: ").append(stack_trace_history.get(index).get(1)).append("\n");
                stacktrace.append("Y stack: ").append(stack_trace_history.get(index).get(2));
                input = Pointer();
            }
        }

        //Add all attributes to model and send back to jsp
        model.addAttribute("memory", memory.toString());
        model.addAttribute("stack", stacktrace.toString());
        model.addAttribute("output", output.toString());
        model.addAttribute("input", input);
        return "Simulation-logged-in";
    }
}
