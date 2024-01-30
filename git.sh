for i in {1..5};
do 
    sleep 1
    echo README.md >> "a"
    git add .
    git commit -m "a"
    git push origin master
    echo "$i - commit"
done