import vim
import sys
import threading
import time
from PyQt4 import QtGui, QtCore

from aoc.db.databases import default_connection
from aoc.db.oracle import Orela


window = None
app = None

class Window(QtGui.QWidget):

    pop_signal = QtCore.pyqtSignal(object, object)
    execute_signal = QtCore.pyqtSignal(object, object)

    def __init__(self): #, data, headers):
        QtGui.QWidget.__init__(self)
        self.table = QtGui.QTableWidget(1, 1, self)

        # self.buttonOpen = QtGui.QPushButton('Open', self)
        # self.buttonSave = QtGui.QPushButton('Save', self)
        # self.buttonOpen.clicked.connect(self.handleOpen)
        # self.buttonSave.clicked.connect(self.handleSave)
        layout = QtGui.QVBoxLayout(self)
        layout.addWidget(self.table)
        # layout.addWidget(self.buttonOpen)
        # layout.addWidget(self.buttonSave)

        self.pop_signal.connect(self.populate)
        self.execute_signal.connect(self.execute)


    def populate(self, data, headers):
        # clear the table
        self.table.setRowCount(0)
        self.table.setColumnCount(0)

        # set the real values
        self.table.setRowCount(len(data))
        self.table.setColumnCount(len(data[0]))


        # for j,field in enumerate(headers):
        #     item = QtGui.QTableWidgetItem(str(field))
        #     self.table.setHorizontalHeaderItem(j, item)
        # self.table.setHorizontalHeaderLabels(headers)
        self.table.setHorizontalHeaderLabels(headers)

        for i,row in enumerate(data):
            for j,field in enumerate(row):
                item = QtGui.QTableWidgetItem(str(field))
                self.table.setItem(i, j, item)

    def execute(database, query):
        conn = default_connection.get(database)
        cur = conn.cursor()

        cur.execute(query)

        # scratch.append('\t'.join([i[0] for i in cur.description]))    
        headers = [i[0] for i in cur.description]

        # for i,row in enumerate(cur):
        #     scratch.append('\t'.join([str(j) for j in row]))
        #     if i > 10: break
        
        data = cur.fetchmany(50)


    # def handleSave(self):
    #     path = QtGui.QFileDialog.getSaveFileName(
    #             self, 'Save File', '', 'CSV(*.csv)')
    #     if not path.isEmpty():
    #         with open(unicode(path), 'wb') as stream:
    #             writer = csv.writer(stream)
    #             for row in range(self.table.rowCount()):
    #                 rowdata = []
    #                 for column in range(self.table.columnCount()):
    #                     item = self.table.item(row, column)
    #                     if item is not None:
    #                         rowdata.append(
    #                             unicode(item.text()).encode('utf8'))
    #                     else:
    #                         rowdata.append('')
    #                 writer.writerow(rowdata)

    # def handleOpen(self):
    #     path = QtGui.QFileDialog.getOpenFileName(
    #             self, 'Open File', '', 'CSV(*.csv)')
    #     if not path.isEmpty():
    #         with open(unicode(path), 'rb') as stream:
    #             self.table.setRowCount(0)
    #             self.table.setColumnCount(0)
    #             for rowdata in csv.reader(stream):
    #                 row = self.table.rowCount()
    #                 self.table.insertRow(row)
    #                 self.table.setColumnCount(len(rowdata))
    #                 for column, data in enumerate(rowdata):
    #                     item = QtGui.QTableWidgetItem(data.decode('utf8'))
    #                     self.table.setItem(row, column, item)


def showWindow():
    global window, app

    app = QtGui.QApplication(sys.argv)
    window = Window()
    # window.resize(640, 480)
    window.show()
    # sys.exit(app.exec_())
    app.exec_()

    # when the qt app ends, get rid of the window
    del app
    del window
    window = None


def run_sql(cmdline, from_line, to_line):
    global window


    # break the commandline up here
    database = cmdline

    from_line = int(from_line) - 1  # buffer is 0-index
    to_line = int(to_line)          # however, to_line reports one less

    query = '\n'.join(vim.current.buffer[from_line:to_line]).replace(';', '')

    # (row, col) = vim.current.window.cursor
    # line = vim.current.buffer[from_line] # 0 vs 1 based

    # get a new scratch buffer
    # vim.command('botright new')
    # vim.command('setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap')
    # scratch = vim.current.buffer

    # vim.current.buffer[row-1] = "haha broke your code!"
    # scratch.append("Query executed against: {}".format(database))
    # scratch.append("start pos: {}, end pos: {}".format(from_line, to_line))

    # vim.current.window.cursor = (1, 0)

    # del vim.current.buffer[3] # also works with slices

    # get the visual selection: vim.current.buffer.mark('<') # start, > is end

    conn = default_connection.get(database)
    cur = conn.cursor()

    cur.execute(query)

    # scratch.append('\t'.join([i[0] for i in cur.description]))    
    headers = [i[0] for i in cur.description]

    # for i,row in enumerate(cur):
    #     scratch.append('\t'.join([str(j) for j in row]))
    #     if i > 10: break
    
    data = cur.fetchmany(50)

    if not window:
        t = threading.Thread(target=showWindow) #, args=(data, headers))
        # t.daemon = True
        t.start()
        
        # wait for the window to appear. TODO: there must be a better way
        for i in xrange(1000):
            if window: break
            time.sleep(0.1)

    # window.pop_signal(data, headers)
    window.pop_signal.emit(data, headers)

    conn.close()

    vim.command("return 1") # return from the vim function?


def close_sql():
    global app, window

    try:
        if app:
            app.quit()
            del app
            app = None

        if window:
            del window
            window = None

    except: pass


