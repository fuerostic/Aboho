# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass

import threading
import time
"" "Redefine thread class with return value" ""
class MyThread(threading.Thread):
    def __init__(self,func,args):
        super(MyThread,self).__init__()
        self.func = func
        self.args = args
    def run(self):
        self.result = self.func(self.args)
    def get_result(self):
        try:
            return self.result
        except Exception:
            return None

"" "Test function, calculate the sum of two numbers" ""
def fun(a,b):
    time.sleep(1)
    return a+b
li = []
for i in range(4):
    t = MyThread(fun,args=(i,i+1))
    li.append(t)
    t.start()
for t in li:
    t.join () # Be sure to join, otherwise the main thread will run faster than the child thread and you will not get results
    print (t.get_result())
