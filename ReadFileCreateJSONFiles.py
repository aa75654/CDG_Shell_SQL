import sys

#Reading the input arguments & assigning it to the varialbles after spliting by ';'
inputString = sys.argv[1]
splitValues = inputString.split(';')

JenkinsJobName=splitValues[0]
JenkinsBuildNumber=splitValues[1]
JiraAppBuildNumber=splitValues[2]
JirafixVersions=splitValues[3]
JiraTestEnv=splitValues[4]
JiraTestPlanKey=splitValues[5]
Projectkey=splitValues[6]
SourceFileResultFolder=splitValues[7]
#"C:\\Users\\AB41979\\Desktop\\Python_Jira\\PythonCodeForChanna\\result2.txt"
#SourceFileResultFolder="C:\\Users\\AB41979\\Desktop\\Python_Jira\\PythonCodeForChanna\\"
ResulFiletFolderPath=SourceFileResultFolder
SourceFilePath=SourceFileResultFolder+"result2.txt"



testCaseDict = {}

#Dictionary Creation Function using the result file.
def dictionaryCreationFunction(TestCaseName, TestCaseID, TestCaseStatus, TestCaseComments):
    testCaseDict[TestCaseName] = {"comment": TestCaseComments, "status": TestCaseStatus, "testKey": TestCaseID}


f = open(SourceFilePath, "r")
count = 0
for x in f:
    count = count + 1
    print(x)
    tempArray1 = x.split(",")
    tempArray = []
    for element in tempArray1:
        tempArray.append(element.strip())  # removes the new line element
    dictionaryCreationFunction("testcase" + str(count), str.strip(tempArray[0]), str(tempArray[1]), str(tempArray[2]))

# dictionaryCreationFunction("testcase3","AAD-127","PASSED","N/A")
print("\n" * 5)
print("Printing the Dictionary")
print(testCaseDict)


def JsonInfoTestFile_Creation(JenkinsJobName, JenkinsBuildNumber, JiraAppBuildNumber, JirafixVersions, JiraTestEnv,
                              JiraTestPlanKey, Projectkey, testCaseDict):
    import json
    import sys
    import base64
    from pathlib import Path
    from ast import literal_eval
    resultFilePath = ResulFiletFolderPath
    CommentsSection = "Jenkins Job Name:" + JenkinsJobName + "\n" + "Jenkins Build Number:" + JenkinsBuildNumber + "\n" + "Application Build Number:" + JiraAppBuildNumber
    print(JirafixVersions)
    if str(JirafixVersions) == "N/A":
        if str(JiraTestPlanKey) == "N/A":
            ##        No FixVersion & No Test Plan Id
            Infojsonstring = {
                "fields": {"customfield_10088": CommentsSection, "description": "Execution results from Automation",
                           "issuetype": {"name": "Test Execution"}, "labels": ["PYTHONJIRA"],
                           "project": {"key": Projectkey}, "summary": "AutomatedExecution from Jenkins"},
                "xrayFields": {"environments": [JiraTestEnv]}}
        else:
            ##        No Fix Version & Plan ID
            Infojsonstring = {
                "fields": {"customfield_10088": CommentsSection, "description": "Execution results from Automation",
                           "issuetype": {"name": "Test Execution"}, "labels": ["PYTHONJIRA"],
                           "project": {"key": Projectkey}, "summary": "AutomatedExecution from Jenkins"},
                "xrayFields": {"environments": [JiraTestEnv], "testPlanKey": JiraTestPlanKey}}
    else:
        if str(JiraTestPlanKey) == "N/A":
            ##        Fix Version & No Plan ID
            Infojsonstring = {
                "fields": {"customfield_10088": CommentsSection, "description": "Execution results from Automation",
                           "summary": "AutomatedExecution from Jenkins", "issuetype": {"name": "Test Execution"},
                           "labels": ["PYTHONJIRA"], "project": {"key": Projectkey},
                           "fixVersions": [{"name": JirafixVersions}]}, "xrayFields": {"environments": [JiraTestEnv]}}
        else:
            ##      Fix Version & Plan ID
            Infojsonstring = {
                "fields": {"customfield_10088": CommentsSection, "description": "Execution results from Automation",
                           "summary": "AutomatedExecution from Jenkins", "issuetype": {"name": "Test Execution"},
                           "labels": ["PYTHONJIRA"], "project": {"key": Projectkey},
                           "fixVersions": [{"name": JirafixVersions}]},
                "xrayFields": {"environments": [JiraTestEnv], "testPlanKey": JiraTestPlanKey}}

    print("\nFollowing is the Content of File JIRA_Info_JSON.json\n")
    print(Infojsonstring)
    s = json.dumps(Infojsonstring)
    print(s)
    with open(resultFilePath + "JIRA_Info_JSON.json", "w") as f:
        f.write(s)

    temp1 = ""
    couter1 = 1
    for p_id, p_info in testCaseDict.items():
        value2 = {"comment": p_info["comment"], "status": p_info["status"], "testKey": p_info["testKey"]}
        value1 = json.dumps(value2)
        if couter1 >= 2:
            temp1 = temp1 + "," + value1
        else:
            temp1 = temp1 + value1
        couter1 = couter1 + 1
    prefixval = "{\"tests\":["
    suffixval = "]}"
    jsonstring = prefixval + temp1 + suffixval
    print(type(jsonstring))
    print("+++++++++++++++++++")
    print(jsonstring)
    with open(resultFilePath + "JIRA_Tests_JSON.json", "w") as g:
        g.write(jsonstring)

print("Now Calling JSON File Creation Function")
#JsonInfoTestFile_Creation("Python_Sanity", "96", "1.1.1", "N/A", "Test1", "AAD-122", "AAD", testCaseDict)
JsonInfoTestFile_Creation(JenkinsJobName, JenkinsBuildNumber, JiraAppBuildNumber, JirafixVersions, JiraTestEnv,
                              JiraTestPlanKey, Projectkey, testCaseDict)