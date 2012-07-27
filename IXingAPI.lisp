;;; This file was automatically generated by SWIG (http://www.swig.org).
;;; Version 2.0.7
;;;
;;; Do not make changes to this file unless you know what you are doing--modify
;;; the SWIG interface file instead.


;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:eval-when (:compile-toplevel :load-toplevel)
  (cl:unless (cl:fboundp 'swig-lispify)
    (cl:defun swig-lispify (name flag cl:&optional (package cl:*package*))
      (cl:labels ((helper (lst last rest cl:&aux (c (cl:car lst)))
                    (cl:cond
                      ((cl:null lst)
                       rest)
                      ((cl:upper-case-p c)
                       (helper (cl:cdr lst) 'upper
                               (cl:case last
                                 ((lower digit) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:lower-case-p c)
                       (helper (cl:cdr lst) 'lower (cl:cons (cl:char-upcase c) rest)))
                      ((cl:digit-char-p c)
                       (helper (cl:cdr lst) 'digit 
                               (cl:case last
                                 ((upper lower) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:char-equal c #\_)
                       (helper (cl:cdr lst) '_ (cl:cons #\- rest)))
                      (cl:t
                       (cl:error "Invalid character: ~A" c)))))
        (cl:let ((fix (cl:case flag
                        ((constant enumvalue) "+")
                        (variable "*")
                        (cl:t ""))))
          (cl:intern
           (cl:concatenate
            'cl:string
            fix
            (cl:nreverse (helper (cl:concatenate 'cl:list name) cl:nil cl:nil))
            fix)
           package))))))

;;;SWIG wrapper code ends here


(cl:defconstant XM_DISCONNECT 1)

(cl:defconstant XM_RECEIVE_DATA 3)

(cl:defconstant XM_RECEIVE_REAL_DATA 4)

(cl:defconstant XM_LOGIN 5)

(cl:defconstant XM_LOGOUT 6)

(cl:defconstant XM_TIMEOUT_DATA 7)

(cl:defconstant REQUEST_DATA 1)

(cl:defconstant MESSAGE_DATA 2)

(cl:defconstant SYSTEM_ERROR_DATA 3)

(cl:defconstant RELEASE_DATA 4)

(cffi:defcstruct RECV_PACKET
	(nRqID :int)
	(nDataLength :int)
	(nTotalDataBufferSize :int)
	(nElapsedTime :int)
	(nDataMode :int)
	(szTrCode :pointer)
	(cCont :pointer)
	(szContKey :pointer)
	(szUserData :pointer)
	(szBlockName :pointer)
	(lpData :pointer))

(cffi:defcstruct MSG_PACKET
	(nRqID :int)
	(nIsSystemError :int)
	(szMsgCode :pointer)
	(nMsgLength :int)
	(lpszMessageData :pointer))

(cffi:defcstruct RECV_REAL_PACKET
	(szTrCode :pointer)
	(nKeyLength :int)
	(szKeyData :pointer)
	(szRegKey :pointer)
	(nDataLength :int)
	(pszData :string))

(cffi:defcvar ("IXingAPI" IXingAPI)
 :pointer)


