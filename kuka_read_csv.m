clear;
clc;
close all;
format long;

% bewegung-40 (Versuchsnr: 38,39,40)
% filename = '2018-08-23-15-58-42-human_body_detection-points.csv';
% filename = '2018-08-23-16-01-04-human_body_detection-points.csv';
% filename = '2018-08-23-16-03-41-human_body_detection-points.csv';
% bewegung (Versuchsnr: 35,36,37)
% filename = '2018-08-23-15-42-48-human_body_detection-points.csv';
% filename = '2018-08-23-15-46-28-human_body_detection-points.csv';
% filename = '2018-08-23-15-49-22-human_body_detection-points.csv';
% full-body-static (Versuchsnr: 30,31,32)
% filename = '2018-08-23-15-11-44-human_body_detection-points.csv';
% filename = '2018-08-23-15-13-43-human_body_detection-points.csv';
% filename = '2018-08-23-15-16-40-human_body_detection-points.csv';
% full-body-dynamic (Versuchsnr: 33,34)
% filename = '2018-08-23-15-29-03-human_body_detection-points.csv';
% filename = '2018-08-23-15-24-00-human_body_detection-points.csv';

filenames ={'2018-08-23-15-58-42-human_body_detection-points.csv';
            '2018-08-23-16-01-04-human_body_detection-points.csv';
            '2018-08-23-16-03-41-human_body_detection-points.csv';
            '2018-08-23-15-42-48-human_body_detection-points.csv';
            '2018-08-23-15-46-28-human_body_detection-points.csv';
            '2018-08-23-15-49-22-human_body_detection-points.csv';
            '2018-08-23-15-11-44-human_body_detection-points.csv';
            '2018-08-23-15-13-43-human_body_detection-points.csv';
            '2018-08-23-15-16-40-human_body_detection-points.csv';
            '2018-08-23-15-29-03-human_body_detection-points.csv';
            '2018-08-23-15-24-00-human_body_detection-points.csv'};
        
        
        
% outputFileName = '38_2018-08-23-15-58-42_bewegung-40.csv';

% possible targetNames: 'Lfoot', 'Lleg', 'Lknee', 'Lthigh', 'Rfoot', 'Rleg', 'Rknee', 'Rthigh', 'Rhips',
%     'Lhips', 'Neck', 'Rarm', 'Relbow', 'Rforearm', 'Rhand', 'Larm', 'Lelbow', 'Lforearm', 'Lhand', 
%     'FaceLB', 'FaceRB', 'FaceLT', 'FaceRT', 'Rchest', 'Lchest', 'Lshoulder', 'Rshoulder'

% bewegung 40 (kein Kopf, keine Hände, keine Beine, kein Hals - Torso, Oberarme, Unterarme)
targetNames1 = {'Rarm'; 'Relbow'; 'Rforearm'; 'Larm'; 'Lelbow'; 'Lforearm'; 
               'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder';
               'Neck'; 'Lhips'; 'Rhips'};
% bewegung (Keine obere Kopfhälfte, keine Knien und Füße - Untere Kopfhälfte, Hals, Torso, Arme, Hüfte)
targetNames2 = {'Lthigh'; 'Rthigh'; 'Rhips'; 'Lhips'; 'Neck'; 
               'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
               'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};
% full body static & dynamic
targetNames3 = {'Lfoot'; 'Lleg'; 'Lknee'; 'Lthigh'; 'Rfoot'; 'Rleg'; 'Rknee'; 'Rthigh'; 'Rhips';
    'Lhips'; 'Neck'; 'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
    'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};

targetNames4 = {'Point1'; 'Point2'; 'Point3'; 'Point4'; 'Point5'; 'Point6'; 'Point7'; 
            'Point8'; 'Point9'; 'Point10'; 'Point11'; 'Point12'; 'Point13'; 'Point14'; 
            'Point15'; 'Point16'; 'Point17'; 'Point18'; 'Point19'; 'Point20'; 'Point21'; 
            'Point22'; 'Point23'; 'Point24'; 'Point25'; };


%targetNamesAll = { targetNames1; targetNames1; targetNames1; 
%                   targetNames2; targetNames2; targetNames2; 
%                   targetNames3; targetNames3; targetNames3; 
%                   targetNames3; targetNames3};
targetNamesAll = { targetNames4; targetNames4; targetNames4; 
                   targetNames4; targetNames4; targetNames4; 
                   targetNames4; targetNames4; targetNames4; 
                   targetNames4; targetNames4};


outputFileNamesMAT = { '38_2018-08-23-15-58-42_bewegung-40.mat';
                    '39_2018-08-23-16-01-04_bewegung-40.mat';
                    '40_2018-08-23-16-03-41_bewegung-40.mat';
                    '35_2018-08-23-15-42-48_bewegung.mat';
                    '36_2018-08-23-15-46-28_bewegung.mat';
                    '37_2018-08-23-15-49-22_bewegung.mat';
                    '30_2018-08-23-15-11-44_full-body-static.mat';
                    '31_2018-08-23-15-13-43_full-body-static.mat';
                    '32_2018-08-23-15-16-40_full-body-static.mat';
                    '33_2018-08-23-15-29-03_full-body-dynamic.mat';
                    '34_2018-08-23-15-24-00_full-body-dynamic.mat'};
                
outputFileNamesCSV = { '38_2018-08-23-15-58-42_bewegung-40.csv';
                    '39_2018-08-23-16-01-04_bewegung-40.csv';
                    '40_2018-08-23-16-03-41_bewegung-40.csv';
                    '35_2018-08-23-15-42-48_bewegung.csv';
                    '36_2018-08-23-15-46-28_bewegung.csv';
                    '37_2018-08-23-15-49-22_bewegung.csv';
                    '30_2018-08-23-15-11-44_full-body-static.csv';
                    '31_2018-08-23-15-13-43_full-body-static.csv';
                    '32_2018-08-23-15-16-40_full-body-static.csv';
                    '33_2018-08-23-15-29-03_full-body-dynamic.csv';
                    '34_2018-08-23-15-24-00_full-body-dynamic.csv'};               
% for i = 1 : size(targetNamesAll, 1)

frames = int32([12 18 21 30 27 57 15 56 38 21 126]);
    i = 9; % [1,11]
    frame = int32(frames(i));
    targetNames = targetNamesAll{i,1};
    outputFileName_mat = outputFileNamesMAT{i,1};
    outputFileName_csv = outputFileNamesCSV{i,1};
    data = readtable(filenames{i,1},'Delimiter', ',');
    
    tablePrepareTime = table([],'VariableNames',{'Time'});
    for i = 1:size(data,1)
        time = table(datetime(data.time(i),'Format','yyyy/MM/dd/HH:mm:ss.SSSSSS'),'VariableNames',{'Time'});
        tablePrepareTime = [tablePrepareTime;time];
    end
    
    someTime = '2018/08/23/00:00:00.000000';
    someTimeDateTime = datetime(someTime,'Format','yyyy/MM/dd/HH:mm:ss.SSSSSS');
    someTimeDateTimeDuration = tablePrepareTime.Time(size(tablePrepareTime.Time,1)) - tablePrepareTime.Time(1);

    tableTime = table([],'VariableNames',{'Time'});
    for i = 1:size(data,1)
%         time = table(datetime(data.time(i),'Format','yyyy/MM/dd/HH:mm:ss.SSSSSS'),'VariableNames',{'Time'});
        time = table(someTimeDateTime + (i-1) * someTimeDateTimeDuration,'VariableNames',{'Time'});
        tableTime = [tableTime;time];
    end
    
    
%     tableTimeChanged = tableTime;
%     for i = 1:size(tableTime,1)
%         time = table(datetime(data.time(i),'Format','yyyy/MM/dd/HH:mm:ss.SSSSSS'),'VariableNames',{'Time'});
%         tableTime = [tableTime;time];
%     end
% 
%     % names are the same, so any value from data(:,2) is okay
%     tableNames = table(split(regexprep(char(data{1,2}), '[^a-zA-Z,]', ''), ','));
% 
    allPositions = data{:,6};
% 
%     mustcalc = zeros(1,size(tableNames,1));
%     for i = 1:size(tableNames,1)
%         for j = 1:size(targetNames,1)
%             if strcmp(char(tableNames{i,1}), char(targetNames(j))) == 1
%                 mustcalc(i) = 1;
%                 break;
%             end
%         end
%     end
% 
    allPositionsString = '';
    for i = 1:size(allPositions,1)
        allPositionsString = strcat(allPositionsString,char(allPositions{i,1}));
        if i < size(allPositions,1)
            allPositionsString = strcat(allPositionsString,',');
        end
    end
    allPositionsString = regexprep(allPositionsString,'[\n]','');
    allPositionsString = strrep(allPositionsString,'x:','');
    allPositionsString = strrep(allPositionsString,'y:',' ');
    allPositionsString = strrep(allPositionsString,'z:',' ');
    allPositionsDoubleArray = str2num(allPositionsString);
    
    
%     allPositionsString = regexprep(allPositionsString, '[^0-9.-,]', '');
%     allPositionsDoubleArray = str2double(split(allPositionsString, ','));

    result = tableTime;
    for i = 1:size(targetNames,1)
%        if not(mustcalc(i))
%            continue;
%        end
       temp = table([],'VariableNames',{char(targetNames{i,1})});
       for j = 1:size(tableTime,1)
           index = 1+(i-1)*3+(j-1)*3*size(targetNames,1); % 3:xyz and 25:size(tableNames,1)
           posx = allPositionsDoubleArray(1,index);
           if posx > 3.5
               posx = nan;
           end
           posy = allPositionsDoubleArray(1,index+1);
           if posy > 3.5 
               posy = nan;
           end
           posz = allPositionsDoubleArray(1,index+2);
           if posz > 3.5 
               posz = nan;
           end
           temp = [temp;table([posx posy posz],'VariableNames',{char(targetNames{i,1})})];
       end
       result = [result temp];
    end

    
    resultChosen = table();
    for j = 1:+(idivide (size(result, 1),frame)):size(result, 1)
        resultChosen = [resultChosen; result(j:j,:)];
    end
    
    result = resultChosen;

    fig = subplot(3,1,1);
    xticks('auto');
    hold on
    for i = 1:size(targetNames,1)   
        toPlot = result{:,i+1};
        plot(result.Time,toPlot(:,1),'o-')
    end
    hold off
    legend(result.Properties.VariableNames(:,2:size(result.Properties.VariableNames,2)))
    title('x')
    datetick('x');
    xtickformat('HH:mm:ss.SSS');
    xlim([result.Time(1) result.Time(size(result.Time,1))]);

    
   

    timeDiff = 0.1 * (result.Time(size(result.Time,1)) - result.Time(1));
    d = result.Time(1):timeDiff:result.Time(size(result.Time,1));
    xticks(d);

    subplot(3,1,2);
    hold on
    for i = 1:size(targetNames,1)   
        toPlot = result{:,i+1};
        plot(result.Time,toPlot(:,2),'o-') 
    end
    hold off
    title('y')
    datetick('x');
    xtickformat('HH:mm:ss.SSS');
    xlim([result.Time(1) result.Time(size(result.Time,1))]);
    xticks(d);
    
   subplot(3,1,3);
   hold on
   for i = 1:size(targetNames,1)   
       toPlot = result{:,i+1};
       plot(result.Time,toPlot(:,3),'o-') 
   end
   hold off
   title('z')
   datetick('x');
   xtickformat('HH:mm:ss.SSS');
   xlim([result.Time(1) result.Time(size(result.Time,1))]);
   xticks(d);

   path = 'E:\Google drive\HiWi\KUKA\output\';
   outputFileNameMAT = strcat(path, outputFileName_mat);
   outputFileNameCSV = strcat(path, outputFileName_csv);
   
   kuka_tracking_points = result;
   writetable(kuka_tracking_points,outputFileNameCSV,'Delimiter',',','WriteRowNames',true);
   save(outputFileNameMAT, 'kuka_tracking_points');
