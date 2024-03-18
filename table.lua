a = {}
k = "X"
a[k] = 10
a[20] = "great"
print(a["X"])
k=20
print(a[k])
a["X"] = a["X"] + 1
print (a["X"])

a = {}
a["x"] = 10
b = a 
print(b["x"])
b["x"] = 20
print(a["x"])
a = nil
b = nil