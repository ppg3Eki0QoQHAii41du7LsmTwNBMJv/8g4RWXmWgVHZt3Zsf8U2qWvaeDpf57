-- Get a reference to the Workspace service and store it in Global_Variable_1
local Global_Variable_1 = game:GetService("Workspace")

-- Get all descendants of Global_Variable_1 and store them in Global_Variable_2
local Global_Variable_2 = Global_Variable_1:GetDescendants()

-- Define a string Global_Variable_3 with the value "AC6_FE_Sounds"
local Global_Variable_3 = "AC6_FE_Sounds"

-- Define a string Global_Variable_4 with the value "RemoteEvent"
local Global_Variable_4 = "RemoteEvent"

-- Define a table Global_Variable_5 with some string values
local Global_Variable_5 = {
    "Rev"
}

-- Define a string Global_Variable_7 with the value "stopSound"
local Global_Variable_7 = "stopSound"

-- Define a string Global_Variable_8 with the value "Sound"
local Global_Variable_8 = "Sound"

-- Loop through each element in Global_Variable_2
for Variable_1, Variable_2 in next, Global_Variable_2 do
    -- Check if the name of Variable_2 matches Global_Variable_3 and if it's of type Global_Variable_4
    if  Variable_2.Name == Global_Variable_3 and Variable_2:IsA(Global_Variable_4) then
        -- Get all descendants of the parent of Variable_2 and store them in Variable_3
        local Variable_3 = Variable_2.Parent:GetDescendants()

        -- Loop through each element in Variable_3
        for Variable_4, Variable_5 in next, Variable_3 do
            -- Check if Variable_5 is of type Global_Variable_8 and if its name is not in Global_Variable_5
            if Variable_5:IsA(Global_Variable_8) and not Global_Variable_5[Variable_5.Name] then
                -- Fire a server event with the name Global_Variable_7 and the name of Variable_5
                Variable_2:FireServer(Global_Variable_7, Variable_5.Name)
            end
        end
    end
end
