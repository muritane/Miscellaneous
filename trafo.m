clear;
load('D:\Downloads\KIT_cameraCS_250Hz\KIT30_cameraCS_250Hz.mat');
load('D:\Google drive\HiWi\New\30_2018-08-23-15-11-44_full-body-static.mat'); 

% 30. 1535029910.027839
% 31. 1535030032.759582
% 32. 1535030201.529307
% 33. 1535030951.921615
% 34. 1535030642.484313
% 35. 1535031780.806470
% 36. 1535031994.035716
% 37. 1535032171.249686
% 38. 1535032727.786519
% 39. 1535032875.558160
% 40. 1535033028.457225

begin_times_without_trigger = [ 1535029910.027839; 
                                1535030032.759582;
                                1535030201.529307;
                                1535030951.921615;
                                1535030642.484313;
                                1535031780.806470;
                                1535031994.035716;
                                1535032171.249686;
                                1535032727.786519;
                                1535032875.558160;
                                1535033028.457225];
              
                            
begin_index = -1;
trigger_threshold = 1.;
for i = 2:size(cam_cs_matrix,1)
    if cam_cs_matrix(i, size(cam_cs_matrix,2)) < trigger_threshold && ...
            cam_cs_matrix(i-1, size(cam_cs_matrix,2)) > trigger_threshold
        begin_index = i;
        break;
    end
end

trafos = zeros(4,4,size(result,1)); % 4x4 homogenous matrices
trigger_frequency = 250; % 250Hz

for i = 1:size(result,1)
    skeleton_calculating_timestamp = posixtime(datetime(result{i,1},'Format',...
        'yyyy/MM/dd/HH:mm:ss.SSSSSS','TimeZone','Europe/Berlin'));
    add_to_begin_index = floor(trigger_frequency * (skeleton_calculating_timestamp - begin_times_without_trigger(1,1)));
    trafo_index = begin_index + add_to_begin_index;
    trafos(:,:,i) = [cam_cs_matrix(trafo_index,4), cam_cs_matrix(trafo_index,7), cam_cs_matrix(trafo_index,10), cam_cs_matrix(trafo_index,1)*10^(-3);
                     cam_cs_matrix(trafo_index,5), cam_cs_matrix(trafo_index,8), cam_cs_matrix(trafo_index,11), cam_cs_matrix(trafo_index,2)*10^(-3);
                     cam_cs_matrix(trafo_index,6), cam_cs_matrix(trafo_index,9), cam_cs_matrix(trafo_index,12), cam_cs_matrix(trafo_index,3)*10^(-3);
                                   0,                          0,                             0,                       1];
end

transformed_body_parts = result;
for i = 1:size(result,1)
    for j = 2:size(result,2)
        temp = trafos(:,:,i)*[transpose(result{i,j});1];
        transformed_body_parts{i,j} = transpose(temp(1:3));
    end
end


i = 1;
t = [cam_cs_matrix(i,4), cam_cs_matrix(i,7), cam_cs_matrix(i,10), cam_cs_matrix(i,1)*10^(-3);
     cam_cs_matrix(i,5), cam_cs_matrix(i,8), cam_cs_matrix(i,11), cam_cs_matrix(i,2)*10^(-3);
     cam_cs_matrix(i,6), cam_cs_matrix(i,9), cam_cs_matrix(i,12), cam_cs_matrix(i,3)*10^(-3);
            0,                   0,                   0,                       1];

new = t * [transpose(result{1,2});1];

% secondtime = 1535029910.027839;
% check_time = datetime(secondtime, 'ConvertFrom','posixtime')
% format longG
% check_1 = datetime('2018/08/23/15:13:52','Format','yyyy/MM/dd/HH:mm:ss.SSSSSS','TimeZone','Europe/Berlin')
% secondtime = 1535030032.759582;
% check_time = datetime(secondtime, 'ConvertFrom','posixtime','TimeZone','Europe/Berlin')

