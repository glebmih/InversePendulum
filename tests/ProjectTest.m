classdef ProjectTest < matlab.unittest.TestCase
    methods(Test)
        function TestOvershoot(testCase)
            maximum_overshoot = 10;

            model = 'Final_project'

            simOut = sim(model);

            data = simOut.logsout.get('position'); 
            time = data.Values.Time;
            values = data.Values.Data;

            info = stepinfo(values, time);
            
            overshoot = info.Overshoot;

            testCase.assertLessThan(overshoot, maximum_overshoot, ...
                'Overshoot exceeded allowed limit');
        end
        function TestSettingTime(testCase)
            maximum_setting_time = 1;

            model = 'Final_project'

            simOut = sim(model);

            data = simOut.logsout.get('position'); 
            time = data.Values.Time;
            values = data.Values.Data;

            info = stepinfo(values, time, 'SettlingTimeThreshold', 0.05);
            
            settlingTime = info.SettlingTime;

            testCase.assertLessThan(settlingTime, maximum_setting_time, ...
                'Setting time exceeded allowed limit');
        end
    end
end
