(eval-when (:compile-toplevel :load-toplevel :execute)
  (asdf:oos 'asdf:load-op :cffi))

(defpackage :cffi-user
  (:use :common-lisp :cffi))

(in-package :cffi-user)

(define-foreign-library lib-user32
  (t (:default "user32")))

(use-foreign-library lib-user32)

(defctype hwnd :unsigned-int)

(defcfun "MessageBoxA" :int
  (wnd     hwnd)
  (text    :string)
  (caption :string)
  (type    :unsigned-int))

(define-foreign-library xingapi
  (t (:default "./xingAPI")))

(use-foreign-library xingapi)

;; BOOL __stdcall ETK_Connect ( 
;; 	HWND 		hWnd, 
;; 	const char*	pszSvr, 
;; 	int		nPort,
;; 	int		nStartMsgID,
;; 	int		nTimeOut,
;; 	int		nSendMaxPacketSize
;; )

(defcfun "ETK-Connect" :int ; 0(FALSE) 이면 실패
  (hWnd hwnd)               ; 1(TRUE) 이면 성공
  (pszSvr :string)
  (nPort :int)
  (nStartMsgID :int)
  (nTimeOut :int)
  (nSendMaxPacketSize :int))

(defcfun "ETK_IsConnected" :int) ; 0(FALSE) 이면 연결중이 아님
				 ; 1(TRUE) 이면 연결중
(defcfun "ETK_Disconnect" :int) ; 무조건 1(TRUE) 반환

(defcfun "ETK_Login" :int ; 0 이 아니면 성공(로그인 성공이 아니라 서버로 로그인요청 전송성공을 의미)
  (hWnd hwnd)             ; 0 이면 실패
  (pszID :string)
  (pszPwd :string)
  (pszCertPwd :string)
  (nType :int)
  (bShowCertErrDlg :int))

(defcfun "ETK_Logout" :int ; 0 이 아니면 성공(로그아웃 성공이 아니라 서버로 로그아웃요청 전송성공을 의미)
  (hWnd hwnd))             ; 0 이면 실패


(defcfun "ETK_GetServerName" ; 반환값 없음
    (pszName :string))

(defcfun "ETK_GetLastError" :int) ; 반환값 Error Code

(defcfun "ETK_GetErrorMessage" :int ; 반환값 Message 길이
  (nErrorCode :int)
  (pszMsg :string)
  (nMsgSize :int))

(defun connect-server ()
    (progn
      (if (ETK_IsConnected)
	  (ETK_DisConnect))
      (setf bResult (ETK_Connect 0 "hts.etrade.co.kr" 20001 1024 -1 -1))
      (if (not (bResult))
	  (progn
	    (setf nErrorCode (ETK_GetLastError))
	    (setf strMsg (ETK_GetErrorMessage nErrorCode "??" 100))
	    (MessageBoxA 0 strMsg "Connect Failed" 0))
	  (MessageBoxA 0 "Connected to server" "Connected" 0))))


(connect-server)
	  
  

;; (ETK-Connect 0 "hts.etrade.co.kr" 20001 1024 10 -1)

;; (MessageBoxA
;;   0
;;   "OH HAI!"
;;   "THIS IS MESSAGE FROM OUTER SPACE"
;;   0)
