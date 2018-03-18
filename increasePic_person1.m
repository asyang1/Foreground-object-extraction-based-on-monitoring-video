clear;
DIR='D:\��ѧ��ģ\����\data\question3\people1\pre-picture\';        %ͼƬ�����ļ���
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����

change = cell(filenum,1);
%1-10�ű���ͼ
N = 20;
for current = 1:10
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
%     imshow(changeframe);
    fname = strcat(DIR, num2str(30), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
%     imshow(exampleframe);
            for i = 80 :183
                for j = 120:210
                    changeframe(i,j) = exampleframe(i+3,j+70);
                end
            end
%     imshow(changeframe);
    change{current} = changeframe;
end

%11-20��
move = 1;
for current = 11:20
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
%     imshow(changeframe);
    fname = strcat(DIR, num2str(40), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
%     imshow(exampleframe);
    
    for i = 77 :180
        for j = 125:184
            changeframe(i,j) = exampleframe(i+10+fix(move),j+20) ;
        end
    end
%     imshow(changeframe);
    change{current} = changeframe;
    move = move +0.3;
end

%21��30��
move = 0;
for current = 21:30
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
%     imshow(changeframe);
    fname = strcat(DIR, num2str(1), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
%     imshow(exampleframe);
    for i = 75 :172
        for j = 120:179
            changeframe(i,j) = exampleframe(i+2 - fix(move),j-65) ;
        end
    end
%     imshow(changeframe);
    change{current} = changeframe;
    move = move +0.6
end


%31��40��
move = 0;
move1 = 0;
for current = 31:40
    fname = strcat(DIR, num2str(current), '.jpg');
    frame = imread(fname);
    changeframe  = frame;
%     imshow(changeframe);
    fname = strcat(DIR, num2str(1), '.jpg');
    frame = imread(fname);
    exampleframe = frame;
%     imshow( exampleframe);
    for i = 80 :180
        for j = 91:160
            changeframe(i+fix(move),j-fix(move1)) = exampleframe(i-5,j-76) ;
        end
    end
    imshow(changeframe);
    change{current} = changeframe;
    move = move+0.7;
    move1 =move1+3; 
end

% mean = (changeframe1+changeframe2+changeframe3)/3;

DIR2='D:\��ѧ��ģ\����\data\question3\people1\increase\';     %��֡ͼƬ�����ļ���
for i = 1:N
    for num = 1:filenum
        fname = strcat(DIR2, num2str(num+filenum*2*(i-1)), '.jpg');
        imwrite(change{num,1},fname);
    end
    back = 1;
     for num = filenum:-1:1
        fname = strcat(DIR2, num2str(back+filenum+filenum*2*(i-1)), '.jpg');
        imwrite(change{num,1},fname);
        back = back+1;
    end
end

% fname = strcat(DIR2, '0.jpg');
% imwrite(mean,fname);


% % DIR2='D:\��ѧ��ģ\����\data\question3\cars6\aft-picture\';     %��֡ͼƬ�����ļ���
% for i = N*(sample-1) +1:N*(sample-1) + N
%     fname = strcat(DIR2, num2str(i), '.jpg');
%     imwrite(changeframe,fname);
% end
% 
% 
% 
% % DIR2='D:\��ѧ��ģ\����\data\question3\cars6\aft-picture\';     %��֡ͼƬ�����ļ���
% for i = N*(sample-1) +1:N*(sample-1) + N
%     fname = strcat(DIR2, num2str(i), '.jpg');
%     imwrite(changeframe,fname);
% end



% DIR2='D:\��ѧ��ģ\����\data\question3\cars6\aft-picture\';     %��֡ͼƬ�����ļ���
 i = 1;
for num = 2*filenum*N +1:2*filenum*N+ filenum
    fname = strcat(DIR, num2str(i), '.jpg');
    frame = imread(fname);
    fname = strcat(DIR2, num2str(num), '.jpg');
    imwrite(frame,fname);
    i = i+1;
end

%�����е�֡ͼƬת��Ϊ��Ƶ
% DIR2='D:\��ѧ��ģ\����\data\question3\cars6\increase\';        %ͼƬ�����ļ���
file=dir(strcat(DIR2,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����

obj_gray = VideoWriter('D:\��ѧ��ģ\����\data\question3\people1\increase-person1.avi');   %��ת���ɵ���Ƶ����
writerFrames = filenum;                       %��Ƶ֡��

%������ͼƬ����avi�ļ�
open(obj_gray);
for k = 1: writerFrames 
    fname = strcat(DIR2, num2str(k), '.jpg');
    frame = imread(fname);
    writeVideo(obj_gray, frame);
end
close(obj_gray);
