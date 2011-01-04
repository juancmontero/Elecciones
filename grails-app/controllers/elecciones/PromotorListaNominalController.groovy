package elecciones

class PromotorListaNominalController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [promotorListaNominalInstanceList: PromotorListaNominal.list(params), promotorListaNominalInstanceTotal: PromotorListaNominal.count()]
    }

    def create = {
        def promotorListaNominalInstance = new PromotorListaNominal()
        promotorListaNominalInstance.properties = params
        return [promotorListaNominalInstance: promotorListaNominalInstance]
    }

    def save = {
        def promotorListaNominalInstance = new PromotorListaNominal(params)
        if (promotorListaNominalInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), promotorListaNominalInstance.id])}"
            redirect(action: "show", id: promotorListaNominalInstance.id)
        }
        else {
            render(view: "create", model: [promotorListaNominalInstance: promotorListaNominalInstance])
        }
    }

    def show = {
        def promotorListaNominalInstance = PromotorListaNominal.get(params.id)
        if (!promotorListaNominalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), params.id])}"
            redirect(action: "list")
        }
        else {
            [promotorListaNominalInstance: promotorListaNominalInstance]
        }
    }

    def edit = {
        def promotorListaNominalInstance = PromotorListaNominal.get(params.id)
        if (!promotorListaNominalInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [promotorListaNominalInstance: promotorListaNominalInstance]
        }
    }

    def update = {
        def promotorListaNominalInstance = PromotorListaNominal.get(params.id)
        if (promotorListaNominalInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (promotorListaNominalInstance.version > version) {
                    
                    promotorListaNominalInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal')] as Object[], "Another user has updated this PromotorListaNominal while you were editing")
                    render(view: "edit", model: [promotorListaNominalInstance: promotorListaNominalInstance])
                    return
                }
            }
            promotorListaNominalInstance.properties = params
            if (!promotorListaNominalInstance.hasErrors() && promotorListaNominalInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), promotorListaNominalInstance.id])}"
                redirect(action: "show", id: promotorListaNominalInstance.id)
            }
            else {
                render(view: "edit", model: [promotorListaNominalInstance: promotorListaNominalInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def promotorListaNominalInstance = PromotorListaNominal.get(params.id)
        if (promotorListaNominalInstance) {
            try {
                promotorListaNominalInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'promotorListaNominal.label', default: 'PromotorListaNominal'), params.id])}"
            redirect(action: "list")
        }
    }
}
