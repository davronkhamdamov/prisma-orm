for i in {1..10};
do 
    sleep 1
    echo "a" >> README.md
    git add .
    git commit -m "$i - commit"
    git push origin master
    echo "$i - commit"
done