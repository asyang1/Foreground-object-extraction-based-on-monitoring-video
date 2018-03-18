DIR='G:\�о�����ѧ��ģ\��ģ����\D�Լ���\��5��\2����\program\��ֵ֡\';
DIR1='G:\�о�����ѧ��ģ\��ģ����\D�Լ���\��5��\2����\program\����֡\���ж���\';
%������λ�и�
for k=1:filenum
    fname = strcat(DIR, num2str(k+start1), '.jpg');
    New=imread(fname);
    New=im2bw(New,0.8);
    se = strel('square',2);  %����
    New=imdilate(New,se);
    orin=New;
    width=30;   %ģ���ȳ���
    length=70;
    [Lorin,num] = bwlabel(orin,8);  %��8����궨��ͨ��
    stats = regionprops(Lorin,'Area');  %���궨��������
    [b,index]=sort([stats.Area],'descend'); %���������
    % for i=1:size(orin,1)
    [n1,m1]=find(Lorin==index(1)); %��������һ���ҵ�
    lm1=mean(m1); %������
    ln1=mean(n1); 
    subplot(1,2,1)
    imshow(orin);
    hold on
    plot(lm1,ln1,'rs'); %������
    %�Զ�Ѱ�ұ궨�ĺ��ʷ�Χ
    if lm1-width<1
        lm1l=1;
    else
        lm1l=fix(lm1-width);
    end
    if lm1+width>size(orin,2)
        lm1u=size(orin,1);
    else
        lm1u=fix(lm1+width);
    end
    if ln1-length<1
        ln1l=1;
    else
        ln1l=fix(ln1-length);
    end
    if ln1+length>size(orin,1)
        ln1u=size(orin,2);
    else
        ln1u=fix(ln1+length);
    end
%     plot(ones(1,ln1u-ln1l+1)*lm1l,[ln1l:ln1u],'r-');
%     plot(ones(1,ln1u-ln1l+1)*(lm1u),[ln1l:ln1u],'r-');
%     plot([lm1l:lm1u],ones(1,lm1u-lm1l+1)*(ln1l),'r-');
%     plot([lm1l:lm1u],ones(1,lm1u-lm1l+1)*(ln1u),'r-');
%     
    
    %ͬ��
    [n2,m2]=find(Lorin==index(2));
    lm2=mean(m2);
    ln2=mean(n2);
%     subplot(1,2,2)
%     imshow(orin);
%     hold on
    plot(lm2,ln2,'rs');
    if lm2-width<1
        lm2l=1;
    else
        lm2l=fix(lm2-width);
    end
    if lm2+width>size(orin,2)
        lm2u=size(orin,2);
    else
        lm2u=fix(lm2+width);
    end
    if ln2-length<1
        ln2l=1;
    else
        ln2l=fix(ln2-length);
    end
    if ln2+length>size(orin,2)
        ln2u=size(orin,2);
    else
        ln2u=fix(ln2+length);
    end
%     plot(ones(1,ln2u-ln2l+1)*lm2l,[ln2l:ln2u],'r-');
%     plot(ones(1,ln2u-ln2l+1)*(lm2u),[ln2l:ln2u],'r-');
%     plot([lm2l:lm2u],ones(1,lm2u-lm2l+1)*(ln2l),'r-');
%     plot([lm2l:lm2u],ones(1,lm2u-lm2l+1)*(ln2u),'r-');
    
%��ԭͼ�����и�
    x= XX(:,k);
    frameNew=reshape(x,size(frame,1),size(frame,2));
    
    %�������ͼ
    imsplit1=zeros(ln1u-ln1l+1,lm1u-lm1l+1);
    imsplit2=zeros(ln2u-ln2l+1,lm2u-lm2l+1);
    for i=ln1l:ln1u
        for j=lm1l:lm1u
            if(orin(i,j)==1)
                imsplit1(i-ln1l+1,j-lm1l+1)=frameNew(i,j);
            end
        end
    end
    
    %����δ��ͼ
    for i=ln2l:ln2u
        for j=lm2l:lm2u
            if(orin(i,j)==1)
                imsplit2(i-ln2l+1,j-lm2l+1)=frameNew(i,j);
            end
        end
    end
    
    %д��
    fname = strcat(DIR1, num2str(k+start1), '1.jpg');
    imwrite(imsplit1/256,fname);
    fname = strcat(DIR1, num2str(k+start1), '2.jpg');
    imwrite(imsplit2/256,fname);
end