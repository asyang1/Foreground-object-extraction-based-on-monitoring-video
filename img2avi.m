%�����е�֡ͼƬת��Ϊ��Ƶ
DIR='D:\��ѧ��ģ\����\data\question4\lobby\second\';        %ͼƬ�����ļ���
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                         %ͼƬ����

obj_gray = VideoWriter('D:\��ѧ��ģ\����\data\question4\lobby\second-lobby.avi');   %��ת���ɵ���Ƶ����
writerFrames = filenum;                       %��Ƶ֡��

%������ͼƬ����avi�ļ�
open(obj_gray);
for k = 1: writerFrames
    fname = strcat(DIR, num2str(448+k), '.jpg');
    frame = imread(fname);
    writeVideo(obj_gray, frame);
end
close(obj_gray);