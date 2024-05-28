CPATH='.;lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

#2. Check that the student code has the correct file submitted.
if [[ -f student-submission/ListExamples.java ]]; then
    echo "ListExamples.java exists"
else
    echo "ListExamples.java does not exist"
    exit
fi

#3. Get the student code, the .java file with the grading tests, 
#   and any other files the script needs into the grading-area directory. 
#   The grading-area directory is created for you, but you should move the files there.

cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area
echo "Copy successful"

#4. Compile your tests and the student's code from the appropriate directory 
#   with the appropriate classpath commands

cd grading-area
javac -cp $CPATH ListExamples.java TestListExamples.java
EXITCODE=$?
echo "The exit code of javac is $EXITCODE"

if [[ $EXITCODE -ne 0 ]]; then
    set -e
fi

java -cp $CPATH TestListExamples.java


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
