package elecciones

class PromotorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [promotorInstanceList: Promotor.list(params), promotorInstanceTotal: Promotor.count()]
    }

    def create = {
        def promotorInstance = new Promotor()
        promotorInstance.properties = params
        return [promotorInstance: promotorInstance]
    }

    def save = {
        def promotorInstance = new Promotor(params)
        if (promotorInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'promotor.label', default: 'Promotor'), promotorInstance.id])}"
            redirect(action: "show", id: promotorInstance.id)
        }
        else {
            render(view: "create", model: [promotorInstance: promotorInstance])
        }
    }

    def show = {
        def promotorInstance = Promotor.get(params.id)
        if (!promotorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotor.label', default: 'Promotor'), params.id])}"
            redirect(action: "list")
        }
        else {
            [promotorInstance: promotorInstance]
        }
    }

    def edit = {
        def promotorInstance = Promotor.get(params.id)
        if (!promotorInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotor.label', default: 'Promotor'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [promotorInstance: promotorInstance]
        }
    }

    def update = {
        def promotorInstance = Promotor.get(params.id)
        if (promotorInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (promotorInstance.version > version) {
                    
                    promotorInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'promotor.label', default: 'Promotor')] as Object[], "Another user has updated this Promotor while you were editing")
                    render(view: "edit", model: [promotorInstance: promotorInstance])
                    return
                }
            }
            promotorInstance.properties = params
            if (!promotorInstance.hasErrors() && promotorInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'promotor.label', default: 'Promotor'), promotorInstance.id])}"
                redirect(action: "show", id: promotorInstance.id)
            }
            else {
                render(view: "edit", model: [promotorInstance: promotorInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotor.label', default: 'Promotor'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def promotorInstance = Promotor.get(params.id)
        if (promotorInstance) {
            try {
                promotorInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'promotor.label', default: 'Promotor'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'promotor.label', default: 'Promotor'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotor.label', default: 'Promotor'), params.id])}"
            redirect(action: "list")
        }
    }
}
