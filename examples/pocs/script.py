import time
import itertools
import random
import copy

arr = [] # массив для хранения изначальных 5040 brainfuck нагрузок

for i in range(1,5041):  # заполнение этого массива из 5040 файлов
    a = open(str(i)+".bf",'r')
    arr.append(a.read())
    a.close()

arr2 = list(itertools.combinations(arr,2)) # Собираем комбинации

for i in range(len(arr2)): # Исправляем вид массива
    temp_var = arr2[i][0]+arr2[i][1]
    arr2[i] = temp_var

print("""Turn on debug mode?
1 - On
0 - Off

Enter: """)
ntime = int(input()) # Время сна для дебага

temp_arr = copy.deepcopy(arr2) # Делаем копию массива для изменений и выводов
n = 2 # начальное число повторений
while(1):
    for i in range(12698280*(14)*(14)): # 12698280 это len(list(itertools.combinations(arr,2))), 14*14 это число для полного распределения по всем возможным кускам пэйлоада (14 это len(arr2[i]) )
        a = random.randint(0,12)
        b = random.randint(a+1,13)
        begin = arr2[i%12698280][:a]
        end = arr2[i%12698280][b:]
        temp_arr[i%12698280] = begin + arr2[i%12698280][a:b]*n + end # склеивание с добавлением повторения
        print(temp_arr[i%12698280])
        f = open(str((5400*(n-1))+(i+1))+".bf","w") # запись в файл
        f.write(temp_arr[i%12698280])
        f.close()
        time.sleep(ntime)
    n += 1 # переход к новому числу повторений
    temp_arr = copy.deepcopy(arr2) # обновление массива
