import student

proc main() =

    let stu1 = newStudent("Harriet", "Maulguet", 23414)
    let stu2 = newStudent("Daniel", "Murathodzic", 343414)
    let stu3 = newStudent("Bello", "Bella", 234134)

    let stuAr: array[0..2, Student] = [stu1, stu2, stu3]

    stu1.setFstNme("bella")
    stu1.setFstNme("Harri")

    stu1.setStdPrt(stu2)
    stu2.setStdPrt(stu1)

    for stu in stuAr:
        stu.toString()

    echo ""

main()
