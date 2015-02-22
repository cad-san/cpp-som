#This makefile for Util Command

#Set this to @ to keep the makefile quiet
SILENCE = @

#--- Outputs & Inputs ----#
include config.mk

uncrustify:
	${SILENCE} ${SCRIPT_DIR}/uncrustify.sh -f ${SCRIPT_DIR}/.uncrustify.cfg $(SRC_DIRS)
	${SILENCE} ${SCRIPT_DIR}/uncrustify.sh -f ${SCRIPT_DIR}/.uncrustify.cfg $(INC_DIRS)
	${SILENCE} ${SCRIPT_DIR}/uncrustify.sh -f ${SCRIPT_DIR}/.uncrustify.cfg $(TEST_SRC_DIRS)
	${SILENCE} ${SCRIPT_DIR}/uncrustify.sh -f ${SCRIPT_DIR}/.uncrustify.cfg $(MOCKS_SRC_DIRS)

cppcheck:
	${SILENCE} ${SCRIPT_DIR}/cppcheck.sh $(INC_DIRS) $(PROJECT_HOME_DIR)/src
