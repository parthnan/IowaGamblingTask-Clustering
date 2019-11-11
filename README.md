# About the Iowa Gambling Task 
The Iowa Gambling Task is a test for Orbitofrontal Cortex (OFC) dysfunction patients. 
1. Participants are presented with four virtual decks of cards on a computer screen. 
2. They are told that each deck holds cards that will either reward or penalize them, using game money. 
3. The goal of the game is to win as much money as possible. The decks differ from each other in the balance of reward versus penalty cards. Thus, some decks are "bad decks", and other decks are "good decks".

![alt text](https://raw.githubusercontent.com/parthnan/IowaGamblingTask-Clustering/master/iowagambling.png)

Most healthy participants sample cards from each deck, and after about 40 or 50 selections are fairly good at sticking to the good decks. Patients with orbitofrontal cortex (OFC) dysfunction, however, continue to persevere with the bad decks, sometimes even though they know that they are losing money overall.

# Clustering Analysis of Iowa Gambling Test 
Clustering Analysis of all available research data on the Iowa Gambling Task(list of sources in readme) using R. The Scripts produce the output for the most common archetypes among the dataset of one researcher using PCA.
The data used is gathered from the studies of Fernie & Tunney (2006), Fridberg et al. (2010), Kjome et al. (2010), Premkumar et al. (2008), Rodriguez-Sanchez et al. (2005), Toplak et al. (2005), Wood et al. (2005) and Steingroever et al (2013). These are all based on a standardized version of IGT.

The data contains the series data of upto a 100 card choices for each patient, and associated knowlegde on the presence of dysfunction.

Through Clustering Analysis, the typical patterns for the frequency of choices of cards are output as below.

![alt text](https://raw.githubusercontent.com/parthnan/IowaGamblingTask-Clustering/master/eachstudy.png)

# Goal of the project
The dominant patterns for each patient can be analyzed by applying Principal Component Analysis(PCA), and hence, the characteristics of patients with and without OCR can be determined. These characteristics can be used in future machine learning algorithms for detecting OCR though test results.

