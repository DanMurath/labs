import src/heartrate, strutils

proc main =

    echo """
                     *** Compute Heart Rate ***

        Enter '1' to compute Heart Rate for all participants.
        Enter '2' to write the data of all participants to a file.
     """

    let opt: int = readLine(stdin).parseInt()

    var prticipants = newSeq[Participant]()

    let
        p1 = newParticipant("P1", "22/07/2021", "11:09",
                            "/Users/gohan/career/uni/labNim/lab3/data/p1.txt")
        p2 = newParticipant("P2", "30/08/2022", "18:30",
                             "/Users/gohan/career/uni/labNim/lab3/data/p2.txt")
        p3 = newParticipant("P3", "12/12/2021", "09:21",
                             "/Users/gohan/career/uni/labNim/lab3/data/p3.txt")
        p4 = newParticipant("P4", "09/03/2022", "08:44",
                            "/Users/gohan/career/uni/labNim/lab3/data/p4.txt")
        p5 = newParticipant("P5", "02/04/2022", "12:14",
                            "/Users/gohan/career/uni/labNim/lab3/data/p5.txt")

    prticipants.add(p1)
    prticipants.add(p2)
    prticipants.add(p3)
    prticipants.add(p4)
    prticipants.add(p5)

    if opt == 1:
        echo "Participant ID    Date         Time   HR"

        for prt in prticipants:
            echo prt.id, "                ", prt.date, "   ",
                 prt.time, "  ", prt.hRate()

    else:
        let f = open("PData.txt", fmWrite)
        defer: f.close()

        f.writeLine("Participant ID    Date         Time   HR")

        for prt in prticipants:
            var prtInfo = prt.id & "                " & prt.date & "   " & prt.time & "  " & $prt.hRate()
            f.writeLine(prtInfo)

main()
