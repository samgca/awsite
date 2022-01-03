## Django start project
```
Django start project for deploy in aws
```

## Setup and Execution

`Requires Docker`

### Local Installation:

**Note:**

Install pre-commit with `pip install pre-commit`  
Please execute `pre-commit install` once after downloading the repo code.
It will help us keep the code quality in check.  

Run `pre-commit run --all-files` if you want to check your code.   

### Usage

`make up` will expose this service on port 8000

### Tests

`make test` run the tests and close the container shell

### Fixture

`make loaddata` install sample data in the database

### Super User Only Local

`make user` create a super user only run this command in local

### Check code
`make checkcode` check the code with pre-commit

### Extra Commands

`make help` Show commands available

###### Example
`make bash` Drops you into a running container shell
