function [pb1,ps1]=cm_sm33(snr_in_dB)
% [pb,ps]=cm_sm32(snr_in_dB)  
%  CM_SM3 finds the probability of bit error and symbol error for 
%  the given value of snr_in_dB, signal to noise ratio in dB.
N=100; 
E=1;   
% energy per symbol 
snr=10^(snr_in_dB/10);                          % signal to noise ratio 
sgma=sqrt(E/snr)/2;                             % noise variance 
s00=[1 0]; s01=[0 1]; s11=[-1 0]; s10=[0 -1];   % signal mapping
% generation of the data source
numofsymbolerror=0;
numofbiterror=0; 
counter=0;  
while(numofbiterror<100)
    for i=1:N
         temp=rand;          % a uniform random variable between 0 and 1
          if (temp<0.25),      % with probability 1/4, source output is "00"        
              dsource1(i)=0; dsource2(i)=0;
               elseif (temp<0.5),                          % with probability 1/4, source output is "01"     
                   dsource1(i)=0; dsource2(i)=1; 
                    elseif (temp<0.75),                         % with probability 1/4, source output is "10"         
                        dsource1(i)=1; dsource2(i)=0;
                         else                                        % with probability 1/4, source output is "11"        
                             dsource1(i)=1; dsource2(i)=1;
          end
    end
   % detection and the probability of error calculation
   for i=1:N
        % the received signal at the detection, for the ith symbol,is:
         n=sgma*randn(1,2);                          % 2 normal distributed r.v with 0, variance sgma
          if ((dsource1(i)==0) & (dsource2(i)==0))
              r=s00+n;
               elseif ((dsource1(i)==0) & (dsource2(i)==1))
                   r=s01+n;
                    elseif ((dsource1(i)==1) & (dsource2(i)==0))
                        r=s10+n;
          else
              r=s11+n;
          end;
           % The correlation metrics are computed below
           c00=dot(r,s00); c01=dot(r,s01); c10=dot(r,s10); c11=dot(r,s11);     
           % The decision on the ith symbol is made next
            c_max=max([c00,c01,c10,c11]);     
            if (c00==c_max), decis1=0; decis2=0;   
            elseif (c01==c_max), decis1=0; decis2=1;    
            elseif (c10==c_max), decis1=1; decis2=0;    
            else decis1=1; decis2=1; 
            end;
             % Increment the error counter, if the decision is not correct
              symbolerror=0;    
              if (decis1~=dsource1(i))
                  numofbiterror=numofbiterror+1; symbolerror=1;     
              end;      
              if (decis2~=dsource2(i))
                  numofbiterror=numofbiterror+1; symbolerror=1;   
              end;      
              if (symbolerror==1)
                  numofsymbolerror=numofsymbolerror+1; 
              end
   end
   counter=counter+1; 
end
ps1=numofsymbolerror/(N*counter);  % since there are totally N symbols  
pb1=numofbiterror/(2*N*counter);    % since 2N bits are transmitted
         
         
              
end

