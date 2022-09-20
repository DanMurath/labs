import strutils, classes

class HRData:
    var
        file: string

    method setF(file: string) =
        this.file = file

    method getF(): string =
        result = this.file

    method avgRR(): int =
        let info = readFile(this.getF()).strip() # strip removes whitespace
        var rr = info.splitLines()
        var rrTot: int = 0
        var incr: int = 0

        for i in rr:
            rrTot += parseInt(i)
            incr += 1

        result = (rrTot / incr).int

    method hRate(): int = ((60 * 1000) / this.avgRR()).int

class Participant:
    var
        id: string
        date: string
        time: string
        fp: string
        hr: int
        data: HRData

    method init(id: string, date: string, time: string, fp: string) =
        this.id = id
        this.date = date
        this.time = time
        this.fp = fp

        this.data = newHRData()

        this.data.setF(this.fp)
        this.hr = this.data.hRate()
