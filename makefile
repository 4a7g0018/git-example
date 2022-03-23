#Git quick creation user
#
# "*"為必填
# *USER_NAME   -- 上傳要顯示的名稱
# *GITHUB_NAME -- github的名稱"大小寫要一致"
# *USER_EMAIL  -- 上傳要顯示的mail
# *ORIGIN      -- 預設的gihhub git連結
#

USER_NAME  = Benson

GITHUB_NAME = 4a7g0018

USER_EMAIL = 4a7g0018@stust.edu.tw 

ORIGIN = https://github.com/4a7g0018/git-example.git


-init:
	@echo 可以使用 make help 來查找指令 

#=====================================================
#=====================GIT INIT========================
#=====================================================
#第一次建立執行需(此指令包含git安裝)
git-create:
	@git config --global user.name ${USER_NAME}
	@git config --global user.email ${USER_EMAIL}
	@git config --global user.username ${GITHUB_NAME}


#修改上方USER_NAME、USER_EMAIL、GITHUB_NAME後需執行
git-up-user:
	@git config --global --unset user.name ${USER_NAME}
	@git config --global --unset user.email ${USER_EMAIL}
	@git config --global --unset user.username ${GITHUB_NAME}


#修改完上方origin參數後須執行
git-up-origin:
	@echo "=========================="
	@echo "=========================="
	@git remote set-url origin ${ORIGIN}


test:
	@echo $(GITHUB_NAME)
	@echo ${USER_NAME}
	@echo ${USER_EMAIL}


#=======================================================
#======================= git ===========================
#=======================================================
clone:
	@git clone ${ORIGIN}

pull-m:
	@git pull --rebase


#=======================================================
#========================= SSH =========================
#=======================================================

creat-ssh:
	@ssh-keygen -t rsa -C ${GITHUB_NAME}
	@eval $(ssh-agent -s)
	@ssh-add
	@echo "==========================================="
	@echo "==========================================="
	@cat ~/.ssh/id_rsa.pub

ssh-test:
	@ssh -T git@github.com


help:
	@echo "======================================================================================================="
	@echo "首次使用需設定以下參數:"
	@echo "|- 1.USER_NAME   (名稱 - 可以隨便給)"
	@echo "|- 2.GITHUB_NAME (你github的名稱 - 大小寫都要一致)"
	@echo "|- 3.USER_EMAIL  (mail - 可隨便給)"
	@echo "|- 4.ORIGIN      (預設 連結、pull、push專案的URL位置)"
	@echo "|"
	@echo "|- 首次執行請先運行make git-create 建立user_name、maill、github_user_name(如果以設定即可略過此步驟)。"
	@echo "|"
	@echo "|-指令:"
	@echo "|"
	@echo "|--SSH"
	@echo "|	creat-ssh : 快速建立本機SSH Token(建立完成會SSH Token顯示在畫面)。"
	@echo "|"
	@echo "|"
	@echo "|--Git Init"
	@echo "|	git-create    : 首次設定git參數(user.name、user.email、user.username)。"
	@echo "|	git-up-user   : 如有修改文件內的USER_NAME、USER_EMAIL、GITHUB_NASME則需執行，才會更新。"
	@echo "|	git-up-origin : 如有修改文件內的ORIGIN參數則須執行，才會更新。"
	@echo "|"
	@echo "|"
	@echo "|-Git"
	@echo "|	clone   : 將origin檔案clone到本機。"
	@echo "|	pull-m  : 將資料pull下來並merge在一起。"
	@echo "========================================================================================================"
