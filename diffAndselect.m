diff=zeros(rows,filenum-1); %�������
%diffNew1=zeros(size(frame,1),size(frame,2));
%diffNew10=zeros(size(frame,1),size(frame,2));
[r,v] = size(XX);

%���������ص�ľ�ֵ������
mXX = mean(XX , 2);
savXX = XX;

DIR='D:\��ѧ��ģ\����\data\question1\office\background\';     %��֡ͼƬ�����ļ���


x= mXX;
frameNew=reshape(x,size(frame,1),size(frame,2));
% se=strel('disk',6);
% frameNew1=imopen(frameNew,se);
% frameNew2=imclose(frameNew1,se);
fname = strcat(DIR, num2str(1), '.jpg');
imwrite(frameNew/256,fname);





for j=1:filenum
    XX(:,j)=abs(XX(:,j) - mXX);
end
mXX = mean(XX , 2);
sXX = std(XX ,0, 2);

%�жϸ���ʱ��ǰ��Ŀ���λ��
flag = zeros(r,v);
for j = 1: r
    if   mXX(j,1)< 200  &  sXX(j,1)> 5
        flag(j,1:v) = ones(1,v);
    end
    
end


for j=1:filenum-1
    diff(:,j)=abs(XX(:,j)-XX(:,j+1));
end

XXnew=savXX(:,1:filenum-1); %�µ�ͼ�����
for j=1:filenum-1
    for i=1:rows
        if diff(i,j) < 20  & flag(i,j) == 1;
            flag(i,j)= 0;
        end
    end
end

change = 0;
for j=1:filenum-1  
    perflag = reshape(flag(:,j),120,160);
    for rr= 5:115
       for vv = 5:155
            num = 0;
            for kk = -4:4
                    num = num + perflag(rr ,vv + kk);
                    num = num + perflag(rr - 1,vv + kk);
                    num = num + perflag(rr - 2,vv + kk);
                    num = num + perflag(rr + 1 ,vv + kk);
                    num = num + perflag(rr + 2 ,vv + kk);
            end
            if(num > 0)
               flag(rr,vv) = 1;
               change  = change +1;
            else
               flag(rr,vv) = 0;
            end
            
       end
       flag(:,j) = reshape(perflag,19200,1);
    end
    
 end
%  
for i=1:rows
    for j=1:filenum-1    
        if flag(i,j) == 0
            XXnew(i,j) =  0;
        end
    end
end


%diffNew1=reshape(diff(:,1),size(frame,1),size(frame,2));
%diffNew10=reshape(diff(:,10),size(frame,1),size(frame,2));




for k = 1: filenum-1  %������ԭΪfilenum-1��ͼƬ
    x= XXnew(:,k);
    frameNew=reshape(x,size(frame,1),size(frame,2));
    se=strel('disk',6);
    frameNew1=imopen(frameNew,se);
    frameNew2=imclose(frameNew1,se);
    fname = strcat(DIR, num2str(k), '.jpg');
    imwrite(frameNew/256,fname);
end


