function runbin(msteps,E,spin,betac,gam,mea)
lm=length(mea)
nh=length(spin)
mea[1:lm]=0.0
mag=0.0
Eest=0.0
#println(E)
for i=1:msteps
    for j=1:nh 
        k=rand(big(1:nh))
        DE=2*spin[k]*(spin[ivic[k,1]]+spin[ivic[k,3]])+2*(gam/betac)*spin[k]*(spin[ivic[k,2]]+spin[ivic[k,4]])
        #DE=2*spin[k]*(spin[ivic[k,1]]+spin[ivic[k,3]])+2*spin[k]*(spin[ivic[k,2]]+spin[ivic[k,4]])
        #metropolis
        if DE<0
           spin[k]=-spin[k]
           E=E+DE
        else 
           r=rand()
           #if i==1&&j==1 
           # println(r)
           #end
           if r<exp(-betac*DE)
             spin[k]=-spin[k]
             E=E+DE      
           end 
        end   
    end
    mag=mag+abs(sum(spin))/(Nx*Ny)
    #println(E/(Nx*Ny))      
    Eest=Eest+E/(Nx*Ny)
end
mea[1]=mag/msteps
mea[2]=Eest/msteps
#println(mea[2])

#file=open("configuration.dat","a+")
#write(file,join(spin), "\n")
#flush(file)
#close(file)

return mea,E,spin
end


function accmeasure(Vm,Vm2,mea,i,spin)

Vm=Vm+mea
Vm2=Vm2+mea.^2

file=open("measurement.dat","a+")
write(file,join((mea[1],mea[2])," "), "\n")
flush(file)
close(file)

#Current estimates
Vmtemp=Vm./i
Vm2temp=Vm2/i
Vm2temp=sqrt(abs(Vm2temp-Vmtemp.^2  )/i)

file=open("results.dat","w")
write(file,join(("completed bins",i)),"\n")
write(file,join(("< M >= ", Vmtemp[1]," \pm ",Vm2temp[1])," "), "\n")
write(file,join(("< E >= ", Vmtemp[2]," \pm ",Vm2temp[2])," "), "\n")
flush(file)
close(file)


file=open("configuration.dat","a+")
writedlm(file,((1+spin)/2)')
flush(file)
close(file)

#file=open("configuration.dat","a+")
#writedlm(file,collect(spin))
#flush(file)
#close(file)

 
return Vm,Vm2
end 
