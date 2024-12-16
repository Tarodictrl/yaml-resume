<h1 align="center">YAML Resume</h1>
<p align="center"><i>This is a simple project to generate a resume from a YAML file.</i></p>

## 🛠️ Installation

### Install [yq v4](https://mikefarah.gitbook.io/yq/):

```bash
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
```

### Install gem:
```bash
sudo apt install ruby-rubygems
```

### Install [yaml-cv](https://github.com/haath/yaml-cv)

```bash
sudo gem install yaml-cv
```


### Install [wkhtmltopdf](https://github.com/wkhtmltopdf/wkhtmltopdf)
```bash
sudo apt install wkhtmltopdf
```

### Install [Taskfile](https://taskfile.dev)
```bash
sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
```

### Install [pre-commit](https://pre-commit.com)
```bash
sudo apt install pre-commit
```

or using pip3

```bash
pip3 install pre-commit
```

## 🏹 Usage

### Get all available tasks:
```bash
task --list-all
```

### Build
```
task build
```

### Convert to JSON:
```
task json
```


### Search:
Search values for level: (`junior`|`middle`|`senior`)
```
task skill_by_level -- <level>
```