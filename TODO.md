# TODO: SSH_UTILS

## ssh config
- **Reqs**:
		* *Scripted*
        * Windows/Mac/Linux Compatible
        *  GitHub repo
- **Components**
	* *Creates:*
        - ~/.ssh/ ~/.ssh/config
        - ssh-key(s) for ${USER} from configuration options at ~/.ssh
    * *Edits either .bash_profile or ssh_config to permanetly ssh-add keys to users* (mac) keystore
    * *Modifies permissions for ssh keys and config correctly*
- **OPTIONAL FEATURES**
    **Error Handling**
    * Test for directories before creating
    **Operation Automation**
    * Add ssh keys to git hub via script
    * Ansible script for playbook
    **Devops**
    * Travis CI
    * Gitlab Runner/Jenkins
    * Puppet/Cheff