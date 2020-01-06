import PyPDF2

with open('pathfinder.pdf', 'rb') as pdfFileObj:
    
    pdfReader = PyPDF2.PdfFileReader(pdfFileObj)
    if pdfReader.isEncrypted:
        pdfReader.decrypt('')
    pageObj = pdfReader.getPage(37)
    string_to_parse = pageObj.extractText()
    split_string = string_to_parse.split('\n')
    for item in split_string:
        if 'FEAT' in item:
            print (item)

    
