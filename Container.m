classdef Container <handle
    properties
        length;
        height;
    end

    methods
        function obj=Container(length, height)
            obj.length = length;
            obj.height = height;
        end
    end
end