from git import Repo
from datetime import datetime

def gitUpdate():
    gitRepo = r'/home/ubuntu/aceweb'
    commitMessage = 'web updated'
    timeout = 60

    try:
        repo = Repo(gitRepo)
        repo.git.add(update=True)
        repo.index.commit(commitMessage)
        origin = repo.remote(name='origin')
        origin.push()

        print("updating_github : INFO : web updated to github")
    except:
        print("updating_github : ERROR : some error occured while pushing the code")

def date():
    print(datetime.now())
    print("---------------------------------------------------------\n")

if __name__ == "__main__":
    gitUpdate()
    date()