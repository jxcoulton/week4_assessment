#THIS OPENS THE DATA FILE
log_file = open("um-server-01.txt")

#THIS PRINTS ALL DATA WITH THE FIRST 3 LETTERS = TUE
def sales_reports(log_file):
    for line in log_file:
        line = line.rstrip()
        day = line[0:3]
        if day == "Mon":
            print(line)


def melon_reports(log_file):
    for line1 in log_file:
        line1 = line1.rstrip()
        num = int(line1[16:18])
        if num > 10:
            print(line1)

# INVOKING THE SALES_REPORTS FUNCTION WITH THE LOG_FILE AS THE ARGUMENT
melon_reports(log_file)

sales_reports(log_file)

