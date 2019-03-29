from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt
import numpy as np

fmu_name = 'IEEE_39_Buses_base'


name = compile_fmu(fmu_name, fmu_name +".mo")
print('Loading model...............')
print('.........................................')
model = load_fmu(fmu_name + '.fmu')


opts = model.simulate_options()

opts['solver'] = 'CVode' # Not necessary, default solver is CVode
#opts["ncp"] = 200 #Specify that 1000 output points should be returned
# opts['ncp'] = 1000 # Changing the number of communication points.
opts['CVode_options']['discr'] = 'Adams' # Change from using BDF to Adams / quicker 
#opts['initialize'] = False #  initialize the model

opts['CVode_options']['atol'] = 1.0e-6 # Options specific for CVode
opts['CVode_options']['rtol'] = 1.0e-3# Options specific for CVode
# opts['CVode_options']['atol'] = 1.0e-6 # Options specific for CVode

#opts['filter'] =['line_4_5.P12','line_4_5.Q12']
#opts['result_handling']='memory'
#Specifies options
# sim.discr = 'Adams'     #Sets the discretization method
# sim.iter = 'FixedPoint' #Sets the iteration method
# sim.rtol = 1.e-8        #Sets the relative tolerance
# sim.atol = 1.e-6        #Sets the absolute tolerance


print("Simulation ..............")

res = model.simulate(final_time=1000,options=opts)

y1 = res['bus1.V']
y2 = res['bus2.V']
y3 = res['bus3.V']
y4 = res['bus4.V']
y5 = res['bus5.V']
#yt = res['windTyp31.wt3g11.P']
#yt = res['wind3DFIG1.GE_WT_init1.P']
#yt = res['tGen21.Generator.w']
#yt = res['tGen21.frequency']
yf = res['tGen21.Generator.P']

yfn =res['system_fn']
yp =res['system_P']
yq =res['system_Q']
yr=res['loadRamp1.P']
y=[]

yg =[]


t = res['time']

for i in range(1,40):
	p = 'bus'+str(i)+'.V'
	if (i <> 28):
		y.append(res[p])
		print(p, np.mean(res[p]))

for i in range(2,11):
	p = 'tGen1'+str(i)+'.gen.P'
	yg.append(res[p])


plt.figure(1)
plt.title("")
for i in y:
	plt.plot(t,i)

plt.ylabel('Voltage (pu)')
plt.xlabel('Time (s)')
plt.grid(True)


plt.figure(2)
plt.title("")
plt.plot(t,yfn)

plt.ylabel(' System Frequency (Hz)')
plt.xlabel('Time (s)')
plt.grid(True)


# plt.figure(3)
# plt.title("Generators Power MW , t-y ")
# for i in yg:
	# plt.plot(t,i)
# plt.legend(('Power - MW'))
# plt.xlabel('Time (s)')
# plt.grid(True)

# plt.figure(4)
# plt.title("Frequency G Power MW , t-y ")
# plt.plot(t,yf)
# plt.legend(('Power - MW'))
# plt.xlabel('Time (s)')
# plt.grid(True)

# plt.figure(5)
# plt.title("System Active Power - P MW")
# plt.plot(t,yp)
# plt.legend(('Power - MW'))
# plt.xlabel('Time (s)')
# plt.grid(True)

# plt.figure(6)
# plt.title("System Reactive Power - Q MW")
# plt.plot(t,yq)
# plt.legend(('Power - MW'))
# plt.xlabel('Time (s)')
# plt.grid(True)

plt.figure(3)
plt.title("")
plt.plot(t,yr)

plt.ylabel('Power (pu)')
plt.xlabel('Time (s)')
plt.grid(True)




plt.show()
