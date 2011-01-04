package elecciones

class ListaNominalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [listaNominalInstanceList: ListaNominal.list(params), listaNominalInstanceTotal: ListaNominal.count()]
    }

    def create = {
        def listaNominalInstance = new ListaNominal()
        listaNominalInstance.properties = params
        return [listaNominalInstance: listaNominalInstance]
    }

    def save = {
        def listaNominalInstance = new ListaNominal(params)
        if (listaNominalInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), listaNominalInstance.id])}"
            redirect(action: "show", id: listaNominalInstance.id)
        }
        else {
            render(view: "create", model: [listaNominalInstance: listaNominalInstance])
        }
    }

    def show = {
        def listaNominalInstance = ListaNominal.get(params.id)
        if (!listaNominalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), params.id])}"
            redirect(action: "list")
        }
        else {
            [listaNominalInstance: listaNominalInstance]
        }
    }

    def edit = {
        def listaNominalInstance = ListaNominal.get(params.id)
        if (!listaNominalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [listaNominalInstance: listaNominalInstance]
        }
    }

    def update = {
        def listaNominalInstance = ListaNominal.get(params.id)
        if (listaNominalInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (listaNominalInstance.version > version) {
                    
                    listaNominalInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'listaNominal.label', default: 'ListaNominal')] as Object[], "Another user has updated this ListaNominal while you were editing")
                    render(view: "edit", model: [listaNominalInstance: listaNominalInstance])
                    return
                }
            }
            listaNominalInstance.properties = params
            if (!listaNominalInstance.hasErrors() && listaNominalInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), listaNominalInstance.id])}"
                redirect(action: "show", id: listaNominalInstance.id)
            }
            else {
                render(view: "edit", model: [listaNominalInstance: listaNominalInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def listaNominalInstance = ListaNominal.get(params.id)
        if (listaNominalInstance) {
            try {
                listaNominalInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'listaNominal.label', default: 'ListaNominal'), params.id])}"
            redirect(action: "list")
        }
    }
}
