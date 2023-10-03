function [timeOut] = timeConverter(years,smallTime)
    switch nargin
        case 1
            timeOut = years * 365;
        case 2
            if smallTime == 'minutes'
                timeOut = years * 525600;
            elseif smallTime == 'seconds'
                timeOut = years * 31536000;
            else
                error('second input should be ''minutes'' or ''seconds''')
            end
        otherwise
            error('This function expects one or two arguments');
end