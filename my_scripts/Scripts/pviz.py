#! /usr/bin/env python3
"""
Script to help me visualize my project folders by parsing the nomenclature.

> <project area>_<project theme>_<start_date>
"""
from glob import glob
from datetime import datetime


def main():

    # Get folders
    folders = glob("*_*_*")
    print(folders)

    folders = list(map(lambda f: f.split("_"), folders))

    # Transform columns
    for project in folders:
        project[1] = project[1].replace("-", " ")  #  Put spaces
        project[2] = datetime.strptime(project[2], "%d-%m-%Y")  #  Parse dates

    themes = sorted(list(set([p[0] for p in folders])))  #  Take the unique themes

    d = {}
    for theme in themes:
        # Select topics to group on the dict key and them remove the key
        d[theme] = [pjt[1:] for pjt in list(filter(lambda p: p[0] == theme, folders))] 
        d[theme].sort(key=lambda x: x[-1])  #  Sort by date

        # Dates back into string
        for topic in d[theme]:
            topic[-1] = topic[-1].strftime("%d-%m-%Y")
        


    # Pretty printing results
    for i in d:
        print(i)
        print("-"*len(i))

        maxsize = max(map(len, [x[0] for x in d[i]]))

        for j in d[i]:
            j = [s.ljust(maxsize) for s in j]  #  pad each string with spaces
            print(" : ".join(j))  #  produce final string
        print("\n")



if __name__ == "__main__":
    main()

