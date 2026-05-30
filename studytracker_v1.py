import pymysql
import datetime
import matplotlib.pyplot as plt
import time
import pyfiglet

#---CREATE A CONNECTION---
con=pymysql.connect(
    host='localhost',
    user='root',
    password='YOUR PASSWORD',
    db='performance_tracker')
cur=con.cursor()

#---GREETING TO THE USER---
logo=pyfiglet.figlet_format("study   tracker", font="bubble")
print(logo)
time.sleep(1)
def ask_name():
    cur.execute('select * from user_name')
    user=cur.fetchone()
    if user:
        name=user[0]
        print(f"welcome back {name}!")
    else:
        print('~WELCOME TO THE STUDY TRACKER~')
        name=input("what would you like us to call you?")
        cur.execute("insert into user_name values(%s)",(name,))
        con.commit()
        print(f"hello {name}!\n")
        print("**********\n")
ask_name()
time.sleep(1)

#---FUNCTION TO ADD NEW EXAM---
def edit_exam():
    def add_exam():
        ex_no=int(input("enter exam number:"))
        ex_name=input("What is the name of your exam?")
        ex_date=input("When is your exam? (YYYY-MM-DD)")
        cur.execute('insert into exam_info  values(%s,%s,%s)',(ex_no,ex_name,ex_date))
        con.commit()
        print("Exam added succesfully!")
    def del_exam():
        ex_no=int(input("enter exam number:"))
        cur.execute("delete from exam_info where exam_no=(%s)",(ex_no))
        con.commit()
        print("Exam deleted succesfully!")
    while True:
        edit_pref=int(input("do you wish to \n"
                            "1: add a new exam \n"
                            "2: delete an exam \n"
                            "3: exit\n"))
        if (edit_pref==1):
                      add_exam()
        elif(edit_pref==2):
            del_exam()
        elif(edit_pref==3):
            break
        else:
            print("invalid input!")    
#---FUNCTION TO DISPLAY LIST OF EXAMS---
def exam_list():
    cur.execute('select * from exam_info')
    rows=cur.fetchall()
    for i in rows:
        print(i)



#---FUNCTION TO CALCULATE DAYS REMAINING TILL EXAM---
def day_till_ex():
    cur.execute('select * from exam_info')
    for i in cur.fetchall():
        print(i)
    no=int(input("enter exam number\n"))
    cur.execute("select * from exam_info where exam_no=(%s)",(no))
    for i in cur.fetchall():
        name=i[1]
        date=i[2]
        time_left=(date-date.today()).days
    print(f"There are {time_left} days left for {name}")
    if(time_left<=30):
        print("Its time study hard!!!")
    elif(time_left>=60 and time_left<=90):
        print("you still have some time! keep going, you got it!")
    else:
        print("you have plenty time. just be consistent!")
        

#---FUNCTION TO DISPLAY LIST OF EXAMS---
def chap_list():
        ch_options={1:'chapters from 11th grade',
                    2:'chapters from 12th grade',
                    3:'all chapters',
                    4:'completed chapters',
                    5:'pending chapters',
                    6:'mathematics chapters',
                    7:'physics chapters',
                    8:'chemistry chapters'}
        for i in ch_options:
            print(i,"  :      ",ch_options[i])
        pref1=int(input("please enter your preference:"))
        if (pref1==1):
            cur.execute('select * from chapters where ch_class=11;')
            for i in cur.fetchall():
                print(i)
        elif(pref1==2):
            cur.execute('select * from chapters where ch_class=12;')
            for i in cur.fetchall():
                print(i)
        elif(pref1==3):
            cur.execute('select * from chapters ;')
            for i in cur.fetchall():
                print(i)
        elif(pref1==4):
            cur.execute("select * from chapters where status='finished' ;")
            for i in cur.fetchall():
                print(i)
        elif(pref1==5):
            cur.execute("select * from chapters where status='pending' ;")
            for i in cur.fetchall():
                print(i)
        elif(pref1==6):
            cur.execute("select * from chapters where subject='mathermatics' ;")
            for i in cur.fetchall():
                print(i)
        elif(pref1==7):
            cur.execute("select * from chapters where subject='physics' ;")
            for i in cur.fetchall():
                print(i)
        elif(pref1==8):
            cur.execute("select * from chapters where subject='chemistry' ;")
            for i in cur.fetchall():
                print(i)

            
#---FUNCTION TO INPUT TEST SCORES---
def insert_score():
        name=input("what was the name of the exam?")
        mark=int(input("what were the maximum marks?"))
        ttl=int(input("total marks obtained by you?"))
        phy=int(input("marks obtained in physics?"))
        math=int(input("marks obtained in mathematics?"))
        chem=int(input("marks obtained in chemistry?"))
        perc=(ttl/mark)*100
        cur.execute("insert into test_scores (test_name,ttl_marks,ttl_score,phy_score,math_score,chem_score,percentage) values(%s,%s,%s,%s,%s,%s,%s)",(name,mark,ttl,phy,math,chem,perc))
        con.commit()
    
#---FUNCTION TO UPDATE SYLLABUS---
def update_syll():
        def finished():
            ch=input("enter chapter numbers you have finished. eg. 2,3,41")
            lst=ch.split(",")
            ch_lst=[]
            for i in lst:
                ch_lst.append(int(i)) 
            for j in ch_lst:     
                cur.execute("update chapters set status='FINISHED' where ch_no in (%s);",(j)) 
                con.commit()
        def in_progress():
            ch=input("enter chapter numbers og the chapters in progress. eg. 2,3,41")
            lst=ch.split(",")
            ch_lst=[]
            for i in lst:
                ch_lst.append(int(i)) 
            for j in ch_lst:     
                cur.execute("update chapters set status='IN PROGRESS' where ch_no in (%s);",(j))
                con.commit()
        def pending():
            ch=input("enter chapter numbers of pending chapters. eg. 2,3,41")
            lst=ch.split(",")
            ch_lst=[]
            for i in lst:
                ch_lst.append(int(i)) 
            for j in ch_lst:     
                cur.execute("update chapters set status='PENDING' where ch_no in (%s);",(j)) 
                con.commit()
        updt_options={1:"update completed chapters ",
                   2:"update chapters in progress",
                   3:"update pending chapters ",
                       4:"finish updating syllabus progress"}
        for i in updt_options:
             print(i,"  :      ",updt_options[i])
        while True:    
             updt_pref=int(input("enter your preference:"))
             if updt_pref==1:
                 finished()
             elif updt_pref==2:
                 in_progress()
             elif updt_pref==3:
                 pending()
             elif updt_pref==4:
                 break
             else:
                 print("invalid input ")
        print("updated succesfully!")        
                 
                     
#---FUNCTION TO SHOW TEST ANALYSIS---
def test_analysis():
    #ask which graph/analysis user wants to see
    ana_options={1:"overall percentage",
                 2:"physics scores",
                 3:"chemistry scores",
                 4:"mathematics score",
                 5:"all of the above",}
    for i in ana_options:
        print(i,"   :      ",ana_options[i])
    ana_pref=int(input("enter your preference:"))
    print('----------\n')
    
    #overall percentage graph
    def ana_overall():
        cur.execute("select test_name,percentage from test_scores")
        data=cur.fetchall()
        test=[i[0] for i in data]
        score=[i[1] for i in data]
        plt.title('SCORE DATA')
        plt.xlabel("test name")
        plt.ylabel("percentage")
        plt.plot(test,score,marker='*')
        plt.show()

    #physics 
    def ana_phy():
        cur.execute(" select test_name,ttl_marks,phy_score from test_scores;")
        data=cur.fetchall()
        test=[i[0] for i in data]
        score=[(i[2]/(i[1]/3))*100 for i in data]
        plt.title("PHYSICS SCORES")
        plt.xlabel("test name")
        plt.ylabel("physics percentage")
        plt.plot(test,score,marker="o")
        plt.show()
        
   #chemistry 
    def ana_chem():
        cur.execute(" select test_name,ttl_marks,chem_score from test_scores;")
        data=cur.fetchall()
        test=[i[0] for i in data]
        score=[(i[2]/(i[1]/3))*100 for i in data]
        plt.title("CHEMISTRY SCORES")
        plt.xlabel("test name")
        plt.ylabel("chemistry percentage")
        plt.plot(test,score,marker="o")
        plt.show()
        
   #maths      
    def ana_math():
        cur.execute(" select test_name,ttl_marks,math_score from test_scores;")
        data=cur.fetchall()
        test=[i[0] for i in data]
        score=[(i[2]/(i[1]/3))*100 for i in data]
        plt.title("MATHEMATICS SCORES")
        plt.xlabel("test name")
        plt.ylabel("mathematics percentage")
        plt.plot(test,score,marker="o")
        plt.show()
    if (ana_pref==1):
        ana_overall()
    elif(ana_pref==2):
        ana_phy()
    elif(ana_pref==3):
        ana_chem()
    elif(ana_pref==4):
         ana_math()
    elif(ana_pref==5):
         ana_overall()
         ana_phy()
         ana_chem()
         ana_math()
    else:
        print("wrong input!")
        
#function to show syllabus progress:
def syll_progress():
        cur.execute("select count(*) from chapters where status='pending' ")
        a=cur.fetchone()[0]
        cur.execute("select count(*) from chapters where status='finished' " )
        b=cur.fetchone()[0]
        cur.execute("select count(*) from chapters where status='in progress' ")
        c=cur.fetchone()[0]
        y=[a,b,c]
        lab=["pending",'finished','in progress']
        plt.pie(y,labels=lab)
        plt.show()
    

     
#---SHOW AVAILABLE FUNCTIONS---
while True:        
    print("what would you like to do today?")
    #available tasks
    func={1:"edit exam list",
          2:"show exam list",
          3:"time remaining till exam" ,
          4:"show list of chapters",
          5:"update syllabus completion",
          6:"insert test scores",
          7:"show test analysis",
          8:"show syllabus progress",
          9:"exit"}
    for i in func:
        print(i,"   :        ",func[i])
    task=int(input("enter the number:\n"))
    if (task==1):
        edit_exam()
        
    elif(task==2):
        exam_list()
        
    elif(task==3):
        day_till_ex()
        
    elif(task==4):
        chap_list()
        
    elif(task==5):
        update_syll()
        
    elif(task==6):
        insert_score()
        
    elif(task==7):
        test_analysis()
        
    elif(task==8):
        syll_progress()
        
    elif(task==9):
        print("study well!\n----------\n")
        
        break
    else:
        print("invalid input")
    print("\n----------\n\n")    
    time.sleep(2)
    

    
