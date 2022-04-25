#!/usr/bin/env python
# coding: utf-8

import pandas as pd #Gets data manipulation software
import os #allows access to oeprating system functions ?
from glob import glob #simplifies selecting a list of files

def main(): #sets the starting point to execute the command
    
    pdblist=[] #makes pdbs a list
    pdbfiles=glob("../1_relax/output/*/*_scores.sc") #glob together these files and call them pdbfiles
    
    for pdb in pdbfiles: #starting the for loop for each pdb within pdbfiles
        score_file_all = open(pdb).readlines()
        print(pdb)
        headers =  score_file_all[0].split()[1:]
        score_data = [line.split()[1:] for line in score_file_all[1:]] #score data
    
        score_df = pd.DataFrame(score_data, columns = headers, dtype=float)
        score_df = score_df.sort_values(by=["total_score"])

        minimum = score_df.iloc[0] #i think everything above this is to find the score file with the lowest score
    
        print(minimum["description"]) #write out the minimium score with its PDB name
        pdblist.append(minimum["description"]) #adds an item to the list
        
    with open("all_min_pdbs", 'w') as f: #get the scores_all file
        for p in pdblist:
            f.write(f'{p}\n') # print the result into the scores_all file and hit enter
    f.close() #close scores_all

main() #end of main