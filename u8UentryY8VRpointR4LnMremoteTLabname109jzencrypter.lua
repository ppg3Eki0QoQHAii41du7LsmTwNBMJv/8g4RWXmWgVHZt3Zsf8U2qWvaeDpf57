-- Access the ReplicatedStorage service in the game and store it in Global_Variable_1
local Global_Variable_1 = game:GetService("ReplicatedStorage")

-- Wait for the child object named "Loadout" inside ReplicatedStorage and store it in Global_Variable_2
local Global_Variable_2 = Global_Variable_1:WaitForChild("Loadout")

-- Wait for the child object named "InventoryValidation" inside Loadout and store it in Global_Variable_3
local Global_Variable_3 = Global_Variable_2:WaitForChild("InventoryValidation")

-- Require the module specified in Global_Variable_3 and store it in Global_Variable_4
local Global_Variable_4 = require(Global_Variable_3)

-- Define a function named Function_1 that takes two arguments: an Instance and a string
local function Function_1(Argument_1: Instance, Argument_2: string)
    -- Wait until the child object specified by the Argument_2 string is found within Argument_1
    while not Argument_1:FindFirstChild(Argument_2) do
        task.wait(0.5)    
    end

    -- Return the child object found with the specified name
    return Argument_1:FindFirstChild(Argument_2)
end

-- Define a function named Function_2 that takes one argument
local function Function_2(Argument_1)
    -- Check if Argument_1 is nil, if so, return nothing
    if not Argument_1 then
        return
    end

    -- Declare several variables for later use
    local Variable_1 = nil
    local Variable_2 = false
    local Variable_3 = ""
    local Variable_4 = nil

    -- Determine the type of Argument_1 and set Variable_3 accordingly (either Argument_1 itself or its name)
    if typeof(Argument_1) == "string" then
        Variable_3 = Argument_1
    elseif typeof(Argument_1) == "Instance" then
        Variable_3 = Argument_1.Name
    end

    -- Invoke the server function "GetKey" with Argument_1 and store the results in Variable_4 and Variable_1
    Variable_4, Variable_1 = Function_1(Function_1(Global_Variable_1, "Events"), "GetKey"):InvokeServer(Argument_1)
    
    -- Set the name of Variable_4 to the determined name (either Argument_1 or its name)
    Variable_4.Name = Variable_3
    
    -- Check if Variable_4 is a RemoteEvent
    if Variable_4:IsA("RemoteEvent") then
        -- Create a table named Variable_5 with a method "FireServer" to invoke Variable_4 on the server
        local Variable_5 = {}
    
        function Variable_5.FireServer(Argument_1_1, ...)
            Variable_4:FireServer(Variable_4, ...);
        end

        -- Return Variable_5
        return Variable_5
    -- Check if Variable_4 is a RemoteFunction
    elseif Variable_4:IsA("RemoteFunction") then
        -- Create a table named Variable_6 with a method "InvokeServer" to invoke Variable_4 on the server and return its result
        local Variable_6 = {}
    
        function Variable_6.InvokeServer(Argument_1_1, ...)
            return Variable_4:InvokeServer(Variable_1, ...);
        end
    
        -- Return Variable_6
        return Variable_6
    end
end

-- Set the GetRemote function in the Global_Variable_4 module to the Function_2 function
Global_Variable_4.GetRemote = Function_2
