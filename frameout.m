clear;
DIR='D:\��ѧ��ģ\����\data\question4\overpass\modified\';        %ͼƬ�����ļ���
file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
filenum=size(file,1);                           %ͼƬ����

result = zeros(1,filenum);
point = 1;
for i = 1:filenum
    sumk = 0;
    fname = strcat(DIR, num2str(i), '.jpg');
    frame = imread(fname); 
    sumk = sum(sum(frame));
    if sumk == 0
       point = point +1;
       continue;
    else
        result(1,point) = 1;
    end
    point =point +1;
end

for j = 4:point-4-1
   sum = 0;
   left = 0;
   right = 0;
   for kk =1:3
       %�ж�����Ƿ���ǰ��Ŀ��
      if result(j-kk)==1
          left =1;
      end
       %�ж��ұ��Ƿ���ǰ��Ŀ��
      if result(j+kk)==1
         right = 1;
      end
      %�����Ҷ��У���ǰ��Ϊǰ��Ŀ��
      if (left + right) ==2
          result(1,j) =1;
          break;
      end
   end
end
flag =1;
index = 0;
for o = 1:point-1
   if result(1,o)==1
       a(1,flag) = o;
       flag = flag+1;  
   end
end


length = flag -1;
b(1,1) = a(1,1);
flag =1;
for p = 2:length
   if (a(1,p)-a(1,p-1)) ==1
       continue;
   else 
       b(flag,2) = a(1,p-1);
       flag = flag+1;
       b(flag,1) = a(1,p);
      
   end
end
b(flag,2) = a(1,length);
% fid=fopen('D:\��ѧ��ģ\����\data\question4\Campus\result.txt','wt');
% fprintf(fid,'%g\t',b,'ASCII');
% fclose(fid);

