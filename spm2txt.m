function [done]= spm2txt(inputFile, outputFile)

hdF=spm_vol(inputFile);
imF=spm_read_vols(hdF);
redF=GPReduce(imF);

fid=fopen(outputFile,'wt');
fprintf(fid,'%s,%s,%s,%s,\n','value','row','col','dep');
fclose(fid);

for i=1:size(redF,1)
    for j=1:size(redF,2)
        for k=1:size(redF,3)
            fid=fopen(outputFile,'at');
            fprintf(fid,'%s,%s,%s,%s,\n',num2str(redF(i,j,k)),int2str(i),int2str(j),int2str(k));
            fclose(fid);
        end
    end
end

end