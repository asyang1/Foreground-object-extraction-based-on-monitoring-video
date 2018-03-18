diff=zeros(rows,filenum-2); %�������
%diffNew=zeros(size(frame,1),size(frame,2),filenum-2);
%����֡���ַ��İ�����Ӧ��̬ѧ�Ľ�
diffNew=zeros(size(frame,1),size(frame,2));
for j=1:2:filenum-3
    diff(:,j)=abs(XX(:,j)-XX(:,j+2));
end

for j=2:2:filenum-2
    diff(:,j)=abs(XX(:,j)-XX(:,j+2));
end

for j=1:filenum-2
    for i=1:rows
        if diff(i,j)>15
            diff(i,j)=1;
        else
            diff(i,j)=0;
        end
    end
end

for k=1:filenum-2
    diffNew=reshape(diff(:,k),size(frame,1),size(frame,2));
    
    se = strel('square',2);  %����Ŀ����
    diffNewImdilate = imdilate(diffNew,se);
    [diffNewlink8,num] = bwlabel(diffNew,8);
    [diffNewlink8,num1] = bwlabel(diffNewImdilate,8);
    while num1>num/5 %�Զ���������
        diffNewImdilate=imdilate(diffNewImdilate,se);
        [diffNewlink8,num1] = bwlabel(diffNewImdilate,8);
    end
    
    B = bwareaopen(diffNewImdilate,300);   %��ȥС���
    
    se = strel('square',2);  %����
    diffNewImdilate=imdilate(B,se);
    A=imfill(diffNewImdilate,'holes'); %�
    Asum=sum(sum(A)); %ɸѡ
    diffNewImdilate=imdilate(A,se);
    while((sum(sum(diffNewImdilate))<1.5*Asum))  %�Զ���������
        diffNewImdilate=imdilate(diffNewImdilate,se);
    end
    
    se=strel('square',2);  %��ʴ
    diffNewErode=imerode(diffNewImdilate,se);
    diffNewErode1=imerode(diffNewErode,se);
    while (sum(sum(diffNewErode1))>0.8*Asum)  %�Զ���ʴ����
        diffNewErode1=imerode(diffNewErode1,se);
    end
    
    se=strel('disk',1);  %��ʴ
    diffNewopen=imopen(diffNewErode1,se);
    diffNewclose=imclose(diffNewopen,se);
    diffNewopen=imopen(diffNewclose,se);
    diffNewclose=imclose(diffNewopen,se);
    diffNewopen=imopen(diffNewclose,se);
    diffNewclose=imclose(diffNewopen,se);  %�����������
    
    x= XX(:,k);
    frameNew=reshape(x,size(frame,1),size(frame,2));
    frameNew1=zeros(size(frame,1),size(frame,2));
    
    for i=20:size(frame,1)
        for j=1:size(frame,2)
            if (diffNewclose(i,j)==1)
                frameNew1(i,j)=frameNew(i,j);
            end
        end
    end
    
    DIR='G:\�о�����ѧ��ģ\��ģ����\D�Լ���\2017��ȫ���о�����ѧ��ģ����D�⸽��\����2-������Ƶ\�����ζ�-��̬����\office\֡���ַ��޸�֡\';     %��֡ͼƬ�����ļ���
    fname = strcat(DIR, num2str(k), '.jpg');
    imwrite(frameNew1/256,fname);
end


