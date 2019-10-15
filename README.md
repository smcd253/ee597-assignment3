# ee597-assignment3
An analysis of normalized saturation throughput for slotted Aloha and p-CSMA.

by<br>
Bill Wang               student id:<br>
and<br>
Spencer McDonough       student id:<br>

## **Problem 1:** For slotted Aloha with 3 backlogged users, plot the boundary surface of the normalized saturation throughput region using a 3D plot.
![*Figure 1: Normalized Saturation Throughput for Slotted Aloha - 3 Users*](p1-slotted_aloha_3_users.png)

## **Problem 2:** Plot the normalized saturation throughput of p-persistent CSMA as a function of p (assuming all users have the same p) for different values of n.
### Let Ts = 9000 µs, Tc = 8750 µs, the slot time δ = 50 µs. (These are typical numbers for IEEE 802.11). Identify and plot the optimal p parameter as a function of n. Comment on your results
![*Figure 2a: Normalized Saturation Throughput for p-CSMA*](p2-pcsma_norm_sat_throughput.png)

**Discussion:** As we can see, the saturation throughput falls off much quicker with increasing p as we increase the number of users on the network. However, with the right tuning. we can achieve about the same normalized saturation throughput if everyone transmitts with a low probability. This can be seen in figure 2b below.
![*Figure 2b: Normalized Saturation Throughput for p-CSMA*](p2-pcsma_norm_sat_throughput.png)

In p-CSMA, users only have to wait for the length of the idle time slot before transmitting again. Because our idle time slots are much smaller than our successful and collision time slots, we do not pay too much for added users, and our link utilization remains high. However, this is dependent on every user transmitting with p = 1/n, else the link utilization greatly suffers for all users.

## **Problem 3:** Plot the 2-user normalized saturation throughput region for pi-persistent CSMA for different values of Ts/δ = 10, 100, 1000, assuming Ts = Tc. On the same figure, also plot the 2-user throughput region for slotted Aloha.
![*Figure 3: Normalized Saturation Throughput for p-CSMA vs Slotted Aloha*](p3-pCSMA_vs_slottedAloha.png)

## **Problem 4:** For 3 blacklogged users, plot the saturation throughput region for pi-persistent CSMA assuming Ts/δ = 1000 (again, Ts = Tc).
![*Figure 4: Normalized Saturation Throughput for p-CSMA - 3 Users*](p4-piCSMA.png)