
classdef Source < handle
    properties (Access = public)
        wavelength; % scalar
        location; % [x;y], [0;0] is middle
        containter; % container
        phase = 0;
        
    end
    properties (Access = private)
        v = 5;
        density = 10;
        waveFunc; % function handle
    end


    methods
        function obj=Source(containter, wavelength, location, phase)
            obj.containter = containter;
            obj.wavelength = wavelength;
            obj.location = location;
            obj.phase = phase;

            obj.waveFunc = @(x,t) sin((2*pi/wavelength)*x - (2*pi*obj.v/wavelength)*t + phase);
        end

        function [X,Y,Z]=D(obj, t)

            [X,Y] = meshgrid(-obj.containter.length/2:(obj.density)^-1:obj.containter.length/2, -obj.containter.height/2:(obj.density)^-1:obj.containter.height/2);
            R = ((X-obj.location(1)).^2 + (Y-obj.location(2)).^2).^.5;
            Z = obj.waveFunc(R,t);

        end
    end
end