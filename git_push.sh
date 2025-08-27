while ! git push; do
    echo "Push failed, retrying in 10 seconds..."
    sleep 10
done
echo "Push succeeded!"