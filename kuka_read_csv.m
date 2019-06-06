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

targetNames4 = {'Lfoot'; 'Lleg'; 'Lknee'; 'Lthigh'; 'Rfoot'; 'Rleg'; 'Rknee'; 'Rthigh'; 'Rhips';
    'Lhips'; 'Neck'; 'Rarm'; 'Relbow'; 'Rforearm'; 'Rhand'; 'Larm'; 'Lelbow'; 'Lforearm'; 'Lhand'; 
    'FaceLB'; 'FaceRB'; 'FaceLT'; 'FaceRT'; 'Rchest'; 'Lchest'; 'Lshoulder'; 'Rshoulder'};


%targetNamesAll = { targetNames1; targetNames1; targetNames1; 
%                   targetNames2; targetNames2; targetNames2; 
%                   targetNames3; targetNames3; targetNames3; 
%                   targetNames3; targetNames3};
targetNamesAll = { targetNames1; targetNames1; targetNames1; 
                   targetNames2; targetNames2; targetNames2; 
                   targetNames3; targetNames3; targetNames3; 
                   targetNames3; targetNames3};


outputFileNames = { '38_2018-08-23-15-58-42_bewegung-40.csv';
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
    i = 11;
    targetNames = targetNamesAll{i,1};
    outputFileName = outputFileNames{i,1};
    data = readtable(filenames{i,1},'Delimiter', ',');
    % data = readtable(filename,'Delimiter', ',');

    tableTime = table([],'VariableNames',{'Time'});
    for i = 1:size(data,1)
        time = table(datetime(data.time(i),'Format','yyyy/MM/dd/HH:mm:ss.SSSSSS'),'VariableNames',{'Time'});
        tableTime = [tableTime;time];
    end

    % names are the same, so any value from data(:,2) is okay
    tableNames = table(split(regexprep(char(data{1,2}), '[^a-zA-Z,]', ''), ','));

    allPositions = data{:,3};

    mustcalc = zeros(1,size(tableNames,1));
    for i = 1:size(tableNames,1)
        for j = 1:size(targetNames,1)
            if strcmp(char(tableNames{i,1}), char(targetNames(j))) == 1
                mustcalc(i) = 1;
                break;
            end
        end
    end

    allPositionsString = '';
    for i = 1:size(allPositions,1)
        allPositionsString = strcat(allPositionsString,char(allPositions{i,1}));
        if i < size(allPositions,1)
            allPositionsString = strcat(allPositionsString,',');
        end
    end
    allPositionsString = regexprep(allPositionsString, '[^0-9.-,]', '');
    allPositionsDoubleArray = str2double(split(allPositionsString, ','));
    result = tableTime;
    for i = 1:size(tableNames,1)
       if not(mustcalc(i))
           continue;
       end
       temp = table([],'VariableNames',{char(tableNames{i,1})});
       for j = 1:size(tableTime,1)
           index = 1+(i-1)*3+(j-1)*3*size(tableNames,1); % 3:xyz and 27:size(tableNames,1)
           if allPositionsDoubleArray(index,1) == 20000.0
               temp = [temp;table([NaN NaN NaN],'VariableNames',{char(tableNames{i,1})})];
           else
               temp = [temp;table([allPositionsDoubleArray(index,1) allPositionsDoubleArray(index+1,1) allPositionsDoubleArray(index+2,1)]...
                   ,'VariableNames',{char(tableNames{i,1})})];
           end
       end
       result = [result temp];
    end


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

    % ind = linspace(1,length(result.Time),10);
    % ind = round(linspace(1,length(result.Time),10));
    % d(10) = datetime;
    % for i = 1:10
    %     d(i) = result.Time(ind(i));
    % end
    timeDiff = 0.1 * (result.Time(size(result.Time,1)) - result.Time(1));
    d = result.Time(1):timeDiff:result.Time(size(result.Time,1));
    xticks(d);

    % xticks('manual');
    % xticks([result.Time(1), result.Time(size(result.Time,1) / 2), result.Time(size(result.Time,1))]);
    % xticklabels({result.Time(1), result.Time(size(result.Time,1) / 2), result.Time(size(result.Time,1))});


    subplot(3,1,2);
    hold on
    for i = 1:size(targetNames,1)   
        toPlot = result{:,i+1};
        plot(result.Time,toPlot(:,2),'o-') 
    end
    hold off
    % legend(result.Properties.VariableNames(:,2:size(result.Properties.VariableNames,2)))
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
    % legend(result.Properties.VariableNames(:,2:size(result.Properties.VariableNames,2)))
    title('z')
    datetick('x');
    xtickformat('HH:mm:ss.SSS');
    xlim([result.Time(1) result.Time(size(result.Time,1))]);
    xticks(d);

    outputFileName2 = strcat('D:\Google drive\HiWi\New\csv', outputFileName);
%     save('D:\Google drive\HiWi\New','result');
%     save(outputFileName2, 'result');


    writetable(result,outputFileName,'Delimiter',',','WriteRowNames',true);
    fromcsv = readtable(outputFileName,'Delimiter', ',');
%     stringNames = fromcsv.Properties.VariableNames;
    for i = 2 : size(fromcsv.Properties.VariableNames, 2)
        fromcsv.Properties.VariableNames{i} = replace(fromcsv.Properties.VariableNames{i}, '1', 'x');
        fromcsv.Properties.VariableNames{i} = replace(fromcsv.Properties.VariableNames{i}, '2', 'y');
        fromcsv.Properties.VariableNames{i} = replace(fromcsv.Properties.VariableNames{i}, '3', 'z');
    end
    writetable(fromcsv,outputFileName,'Delimiter',',','WriteRowNames',true);
%     prompt = 'next? ';
%     pause = input(prompt)
%     pause2 = pause * 10
 
% end
