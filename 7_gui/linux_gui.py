import tkinter as tk

window = tk.Tk()
window.title("Python按钮示例")

button1 = tk.Button(window, text="按钮1")
button1.grid(row=0, column=0)

button2 = tk.Button(window, text="按钮2")
button2.grid(row=1, column=0)

button3 = tk.Button(window, text="按钮3")
button3.grid(row=2, column=0)

window.mainloop()