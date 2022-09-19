import classes

class Student:
    var # can't create immutable variables?
        fstNme: string
        lstNme: string
        stdNo: int
        prtnr: Student

    method init(fstNme: string, lstNme: string, stdNo: int) =
        this.fstNme = fstNme
        this.lstNme = lstNme
        this.stdNo = stdNo

    method setFstNme(fstNme: string) =
        this.fstNme = fstNme

    method getFstNme(): string =
        result = this.fstNme

    method setLstNme(lstNme: string) =
        this.lstNme = lstNme

    method getLstNme(): string =
        result = this.lstNme

    method getFlNme(): string =
        result = this.getFstNme() & " " & this.getLstNme()

    method setStdNo(stdNo: int) =
        this.stdNo = stdNo

    method getStdNo(): int =
        result = this.stdNo

    method avgMrk(crs: int, exm: int): float =
        result = (crs+exm) / 2

    method setStdPrt(prtnr: Student) =
        this.prtnr = prtnr

    # will return a Student object. Can then be used to retrieve
    # extra info of partner using above methods
    method getStdPrt(): Student =
        result = this.prtnr

    method toString() =
        stdout.write("Name: ", this.getFlNme(), ". ", "StdNo: ",
                     this.getStdNo(), ". ") # echo auto \n, write doesn't

        if this.getStdPrt() != nil:
            echo "Partner: ", this.getStdPrt().getFlNme() # now this is added next to write()
