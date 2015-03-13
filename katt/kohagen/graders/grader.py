import sys

def is_int(arg):
    try:
        int(arg)
        return True
    except:
        return False


def main():
    if "ignore" in sys.argv:
        print "AC 0"
    elif "sum" in sys.argv or "sum2" in sys.argv:
        error = None
        total_score = 0
        successes = []
        subsumes = None
        if "sum2" in sys.argv:
            subsumes = [[], [], [], [0,1,2], [0,1,2,3]]
        for line in sys.stdin.readlines():
            verdict, score = line.split()
            if verdict != "AC" and not error:
                error = verdict
            if subsumes and not all(successes[s] for s in subsumes[len(successes)]):
                score = "0"
            successes.append(verdict == "AC")
            total_score += float(score)
        if not total_score and error:
            print "%s 0" % error
        else:
            print "AC %f" % total_score
    elif "all" in sys.argv:
        total_score = 0
        for arg in sys.argv:
            if is_int(arg):
                total_score = float(arg)
        for line in sys.stdin.readlines():
            verdict, score = line.split()
            if verdict != "AC":
                print "%s 0" % verdict
                return
        print "AC %f" % total_score
    else:
        for line in sys.stdin.readlines():
            print line

main()
