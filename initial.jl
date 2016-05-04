
#global a=MersenneTwister(seed)
#srand(seed)
spin=zeros(Int32,nh)

#random initial configuration
for i = 1:nh
   r=rand()
   #println(r) 
   if r<0.5 
    spin[i]=1
   else
    spin[i]=-1
   end  
end 





betac=betar
gam=betac
#betac=betar

mag=0.0
#initial energy
E=0.0
for i=1:nh
   E=E-spin[i]*spin[ivic[i,1]]-(gam/betac)*spin[i]*spin[ivic[i,2]]
  #  E=E-spin[i]*spin[ivic[i,1]]-spin[i]*spin[ivic[i,2]]
end 

#arryas to accumulate measurements
lm=2
mea=zeros(Float64,lm)
Vm=zeros(Float64,lm)
Vm2=zeros(Float64,lm)
