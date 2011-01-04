package elecciones

class SecRequestmapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [secRequestmapInstanceList: SecRequestmap.list(params), secRequestmapInstanceTotal: SecRequestmap.count()]
    }

    def create = {
        def secRequestmapInstance = new SecRequestmap()
        secRequestmapInstance.properties = params
        return [secRequestmapInstance: secRequestmapInstance]
    }

    def save = {
        def secRequestmapInstance = new SecRequestmap(params)
        if (secRequestmapInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), secRequestmapInstance.id])}"
            redirect(action: "show", id: secRequestmapInstance.id)
        }
        else {
            render(view: "create", model: [secRequestmapInstance: secRequestmapInstance])
        }
    }

    def show = {
        def secRequestmapInstance = SecRequestmap.get(params.id)
        if (!secRequestmapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), params.id])}"
            redirect(action: "list")
        }
        else {
            [secRequestmapInstance: secRequestmapInstance]
        }
    }

    def edit = {
        def secRequestmapInstance = SecRequestmap.get(params.id)
        if (!secRequestmapInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [secRequestmapInstance: secRequestmapInstance]
        }
    }

    def update = {
        def secRequestmapInstance = SecRequestmap.get(params.id)
        if (secRequestmapInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (secRequestmapInstance.version > version) {
                    
                    secRequestmapInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'secRequestmap.label', default: 'SecRequestmap')] as Object[], "Another user has updated this SecRequestmap while you were editing")
                    render(view: "edit", model: [secRequestmapInstance: secRequestmapInstance])
                    return
                }
            }
            secRequestmapInstance.properties = params
            if (!secRequestmapInstance.hasErrors() && secRequestmapInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), secRequestmapInstance.id])}"
                redirect(action: "show", id: secRequestmapInstance.id)
            }
            else {
                render(view: "edit", model: [secRequestmapInstance: secRequestmapInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def secRequestmapInstance = SecRequestmap.get(params.id)
        if (secRequestmapInstance) {
            try {
                secRequestmapInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'secRequestmap.label', default: 'SecRequestmap'), params.id])}"
            redirect(action: "list")
        }
    }
}
